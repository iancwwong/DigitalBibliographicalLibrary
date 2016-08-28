/*
 * This is the class that is responsible for redirecting
 * to multiple pages.
 * NOTE: Does NOT follow MVC, as only 1 controller is allowed, when there
 * are a variety of functions
 */
package edu.unsw.comp9321;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.InputSource;

/**
 * Servlet implementation class ControllerServlet
 */
@WebServlet("/control")
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// xml filename for dataset
	private String xmlFilename = "/DATA-INF/dblp.xml";
	
	// Store the publications, hashed by type
	private HashMap<String, ArrayList<Publication>> publications = new HashMap<String, ArrayList<Publication>>();
	
	// Store number of publications
	private int numPubs = 0;
	
	// Store the mapping of the publication semantic name with technical name
	private HashMap<String, String> publicationTypeMap = new HashMap<String, String>();
	
	// Store the users
	private HashMap<String, UserBean> users = new HashMap<String, UserBean>();
	
	// Random number generator
	Random randomiser;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerServlet() {
        super();

		// Instantiate the type mappings for publications
		// with:
		//      key = semantically equivalent name
        //		value = type name found in xml
		//      value = semantically equivalent name
		this.publicationTypeMap.put("journal", "article");
		this.publicationTypeMap.put("conference (inproceedings)", "inproceedings");
		this.publicationTypeMap.put("conference (proceedings)", "proceedings");
		this.publicationTypeMap.put("book","book");
		this.publicationTypeMap.put("incollection","incollection");
		this.publicationTypeMap.put("phd thesis","phdthesis");
		this.publicationTypeMap.put("masters thesis", "mastersthesis");
		this.publicationTypeMap.put("www", "www");
		
		this.randomiser = new Random();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Check if need to parse xml file
		if (this.publications.size() == 0) {
			parseXMLFile();
		}
		doPost(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Identify the user
		UserBean userBean = (UserBean) request.getSession().getAttribute("userBean");
		
		// Case when no userbean obj found: create and assign
		if (userBean == null) {
			userBean = new UserBean(generateUserID());
			request.getSession().setAttribute("userBean", userBean);
			this.users.put(userBean.userID, userBean);
			System.out.println("New user identified!");
			System.out.println("Their id: " + userBean.userID);
		}
			
		// Determine response to user's desired action
		String redir_page = "indexpage.jsp";		// default page
		boolean redir_changed = false;
		Map<String, String[]> req_parameters = request.getParameterMap();
			if (req_parameters.containsKey("action")) {
			String action = request.getParameter("action");
			switch (action) {
			
				// user wants to see home page
				case "viewIndexPage":
					prepareIndexPage(request);
					redir_page = "indexpage.jsp";
					redir_changed = true;
					break;
					
				// user wants to see the description page
				case "viewAboutPage":
					redir_page = "aboutpage.jsp";
					break;
					
				// user wants to see a particular publication
				case "viewPublicationPage":
					preparePublicationPage(request);
					redir_page = "publicationpage.jsp";
					redir_changed = true;
					break;
					
				// user wants to see their cart
				case "viewCartPage":
					prepareCartPage(request);
					redir_page = "cartpage.jsp";
					redir_changed = true;
					break;
					
				// user wants to search basic fields
				case "searchBasicFields":
					prepareSearchPage(request);
					redir_page = "searchresultspage.jsp";
					redir_changed = true;
					break;
					
				// user wants to add a publication to their cart
				case "addPublicationToCart":
					addPublicationToCart(request);
					preparePublicationPage(request);
					redir_page = "publicationpage.jsp";
					redir_changed = true;
					break;
					
				// user wants to remove publications from their cart
				case "removePublicationsFromCart":
					removePublicationsFromCart(request);
					prepareCartPage(request);
					redir_page = "cartpage.jsp";
					redir_changed = true;
					break;
					
				default:
					break;
			}
		}
			
		// Case when default redirect has not changed: Prepare index page
		if (!redir_changed) {
			prepareIndexPage(request);
		}
				
		// Redirect the page
		RequestDispatcher rd = request.getRequestDispatcher("/"+redir_page);
		rd.forward(request, response);
	}
	
	/*
	 * == USER ACTION FUNCTIONS
	 */
	
	// Prepare the index page
	private void prepareIndexPage(HttpServletRequest request) {
		// Obtain up to 10 random publications (depending on how many publications there are)
		ArrayList<Publication> randPublications = new ArrayList<Publication>();
		Publication randPublication = getRandomPublication();
		while (randPublications.size() < 10 && randPublications.size() < this.numPubs) {
			if (randPublications.contains(randPublication)) {
				randPublication = getRandomPublication();
			} else {
				randPublications.add(randPublication);
			}
		}
		
		// Pass the random publications to index bean, and assign bean to index page
		IndexPageBean indexPageBean = new IndexPageBean(randPublications);
		HttpSession session = request.getSession();
		session.setAttribute("indexPageBean", indexPageBean);	
	}
	
	// Prepare the publication page
	private void preparePublicationPage(HttpServletRequest request) {
		// Obtain the specific ID and type of the publication to view
		String pubID = request.getParameter("pubID");
		String pubType = this.publicationTypeMap.get(request.getParameter("pubType"));
		
		// Obtain the publication object
		Publication pubToView = getSpecificPublication(pubID, pubType);
		
		// Create the view publication bean, assign to page
		PublicationPageBean publicationPageBean = new PublicationPageBean(pubToView);
		HttpSession session = request.getSession();
		session.setAttribute("publicationPageBean", publicationPageBean);
	}
	
	// Prepare the cart page
	private void prepareCartPage(HttpServletRequest request) {
		// Prepare the CartPageBean
		CartPageBean cartPageBean = new CartPageBean();
		
		// Obtain the cart obj from userBean, and assign to cartPageBean
		UserBean userBean = (UserBean) request.getSession().getAttribute("userBean");
		cartPageBean.cart = userBean.cart;
		
		// Bind the cartPageBean to session
		request.getSession().setAttribute("cartPageBean", cartPageBean);
	}
	
	// Prepare the search page
	private void prepareSearchPage(HttpServletRequest request) {
		System.out.println("User wants to do a basic search!");
		System.out.println("The values of fields to search for:");
		System.out.println("* Title: " + request.getParameter("searchTitle"));
		System.out.println("* Authors: " + request.getParameter("searchAuthors"));
		System.out.println("* Type: " + request.getParameter("searchType"));
		System.out.println("* Year: " + request.getParameter("searchYear"));
		System.out.println("* Venue: " + request.getParameter("searchVenue"));
		
		// Search publication(s) specified by search fields
		List<Publication> searchResults = findPublications(
											request.getParameter("searchTitle"),
											request.getParameter("searchAuthors"),
											request.getParameter("searchType"),
											request.getParameter("searchYear"),
											request.getParameter("searchVenue")
										  );
		
		// Construct searchPageBean, bind to session
		SearchPageBean searchPageBean = new SearchPageBean(searchResults);
		request.getSession().setAttribute("searchPageBean", searchPageBean);
	}
	
	// Add publication to user's cart
	private void addPublicationToCart(HttpServletRequest request) {
		// Obtain the publication object specified in the request
		String pubID = request.getParameter("pubID");
		String pubType = this.publicationTypeMap.get(request.getParameter("pubType"));
		Publication pubToAdd = getSpecificPublication(pubID, pubType);
		
		// Add publication to user's cart
		UserBean userBean = (UserBean) request.getSession().getAttribute("userBean");
		userBean.cart.addPublication(pubToAdd);
		
		// Bind userBean back to the session
		request.getSession().setAttribute("userBean", userBean);
	}
	
	// Removes publications from cart, specified in the session request
	private void removePublicationsFromCart(HttpServletRequest request) {
		// Obtain the ID's of publications to be removed
		String[] pubIDs = request.getParameterValues("pubID");
		
		// Remove publications from cart object
		CartPageBean cartPageBean = (CartPageBean) request.getSession().getAttribute("cartPageBean");
		Cart cart = cartPageBean.cart;
		cart.removePublications(pubIDs);
		
		// Reassign cart page bean
		cartPageBean.cart = cart;
		request.getSession().setAttribute("cartPageBean", cartPageBean);
	}
	
	/*
	 * == HELPER FUNCTIONS
	 */	
	
	// Parse dblp.xml into list of publications
	private void parseXMLFile() {
		
        // Parse XML file into publication objects
    	ServletContext context = getServletContext();
    	InputSource xmlFile = new InputSource(context.getResourceAsStream(this.xmlFilename));
    	SAXParserFactory factory = SAXParserFactory.newInstance();
		try {
			System.out.println("Parsing XML file...");
			SAXParser saxParser = factory.newSAXParser();
			SaxPublicationsHandler handler = new SaxPublicationsHandler();
			saxParser.parse(xmlFile,  handler);
			
			this.publications = handler.publications;
			System.out.println("Successfully parsed XML file!");
			
			// Set total number of publications
			for (String publicationType : this.publications.keySet()) {
				System.out.println("Number of " + publicationType + ": " + this.publications.get(publicationType).size());
				this.numPubs += this.publications.get(publicationType).size();
			}
			System.out.println("== Total publications parsed: " + this.numPubs);
						
		} catch (Throwable err) {
			err.printStackTrace();
		}
	}
	
	// Obtain a random publication
	private Publication getRandomPublication() {
		
		// Get random publication list of a random type
		List<String> publicationTypes = new ArrayList<String>(this.publications.keySet());
		String randomPublicationType = publicationTypes.get(this.randomiser.nextInt(publicationTypes.size()));
		ArrayList<Publication> randPublicationList = this.publications.get(randomPublicationType);
		
		// The while loop searches for a non-empty list of publication from which to choose the
		// random publication
		while (randPublicationList.size() == 0) {		
			randomPublicationType = publicationTypes.get(this.randomiser.nextInt(publicationTypes.size()));
			randPublicationList = this.publications.get(randomPublicationType);
		}
		
		// Get random publication
		return randPublicationList.get(this.randomiser.nextInt(randPublicationList.size()));
	}
	
	// Get the publication specified by its ID and type
	// Assume type is always defined in the hashmap as a key
	private Publication getSpecificPublication(String pubID, String pubType) {
		// Obtain the list of the specific type
		ArrayList<Publication> typedPublications = this.publications.get(pubType);
		
		// Find the one
		for (Publication publication : typedPublications) {
			if (publication.id.equals(pubID)) {
				return publication;
			}
		}
		return null;			// not found
	}
	
	// Find the list of publications that match query
	public List<Publication> findPublications(String searchTitle, String searchAuthors, String searchType,
												String searchYear, String searchVenue) {
		
		List<Publication> results = new ArrayList<Publication>();
		return results;
	}
			
	// Generate a unique id for a user
	private String generateUserID() {
		String uniqueID = UUID.randomUUID().toString();
		while (this.users.keySet().contains(uniqueID)) {
			uniqueID = UUID.randomUUID().toString();
		}
		return uniqueID;
	}
}