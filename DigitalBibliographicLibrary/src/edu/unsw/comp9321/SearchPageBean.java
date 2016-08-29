/*
 * This class represent the model for the search results page
 */
package edu.unsw.comp9321;
import java.util.*;

public class SearchPageBean {
	public List<PublicationBean> results = new ArrayList<PublicationBean>();
	public int currPage = 1;
	public int totalPages = 0;
	public int numItemsPerPage = 10;
	
	// Constructor given a list of publications
	public SearchPageBean(List<Publication> searchPublications) {
		
		// Convert list of publications into publicationBeans
		if (searchPublications != null) {
			for (Publication publication : searchPublications) {
				PublicationBean pb = new PublicationBean(publication);
				this.results.add(pb);
			}
		}
		
		// Determine number of pages
		this.totalPages = (int) Math.ceil(new Double(this.results.size()) / new Double(this.numItemsPerPage));
		System.out.println("total pages: " + this.totalPages);
	}
	
	// getters
	public List<PublicationBean> getResults() { return this.results; }
	public int getCurrPage() { return this.currPage; }
	public int getTotalPages() { return this.totalPages; }
	public int getNumItemsPerPage() { return this.numItemsPerPage; }
}
