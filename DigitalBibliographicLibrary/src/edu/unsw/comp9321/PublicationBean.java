/*
 * This is the class that carries the details of a particular publication
 * as a MODEL for viewing publications on the front-end
 */
package edu.unsw.comp9321;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

public class PublicationBean {
	
	// == GENERIC PUBLICATION ATTRIBUTES
	public String id = "";
	public String type = "";
	public String title = "";
	public List<String> authors = new ArrayList<String>();
	public List<String> editors = new ArrayList<String>();
	public String year = "";
	public String venue = "";
	public List<String> urls = new ArrayList<String>();
	public List<String> cites = new ArrayList<String>();
	public String price = "";		// NOTE: Backend represented as double, thus needs to be parsed
	
	// == PUBLICATION SPECIFIC ATTRIBUTES
	// NOTE: This is a list of unique attributes amongst ALL the
	// specific publication types. Refer to "Publications Schema (Reference)"
	// for more info
	public String rating = "";
	public String number = "";
	public String pages = "";
	public String volume = "";
	public String publisher = "";
	public String isbn = "";
	public String series = "";
	
	// == OTHER ATTRIBUTES THAT FACILITATE PRESENTATION
	public String formattedAuthors = "";
	public String formattedEditors = "";
	
	// For converting price to 2dp format
	private DecimalFormat df = new DecimalFormat("#.00");
	
	// Constructor when given the publication class
	public PublicationBean(Publication newPublication) {
		
		// Case when given a null publication
		if (newPublication == null) {
			// do nothing
		}
		
		// Publication given is not null - set fields appropriately
		else {
			// = Consider generic fields
			this.id = newPublication.id;
			this.type = newPublication.type;
			this.title = newPublication.title;
			this.authors = newPublication.authors;
			this.editors = newPublication.editors;
			this.year = newPublication.year;
			this.venue = newPublication.venue;
			this.urls = newPublication.urls;
			this.cites = newPublication.cites;
			this.price = "$" + this.df.format(newPublication.price);

			// = Consider type-specific fields
			switch(newPublication.type) {
			
				// ARTICLE
				case "journal":
					PublicationArticle article_ref = (PublicationArticle) newPublication;
					this.rating = article_ref.rating;
					this.number = article_ref.number;
					this.pages = article_ref.pages;
					this.volume = article_ref.volume;
					break;
					
				case "conference (inproceedings)":
					PublicationInproceedings inproceedings_ref = (PublicationInproceedings) newPublication;
					this.pages = inproceedings_ref.pages;
					this.number = inproceedings_ref.number;
					break;
					
				case "conference (proceedings)":
					PublicationProceedings proceedings_ref = (PublicationProceedings) newPublication;
					this.publisher = proceedings_ref.publisher;
					this.series = proceedings_ref.series;
					this.volume = proceedings_ref.volume;
					this.number = proceedings_ref.number;
					break;
					
				case "book":
					PublicationBook book_ref = (PublicationBook) newPublication;
					this.pages = book_ref.pages;
					this.publisher = book_ref.publisher;
					this.series = book_ref.series;
					this.volume = book_ref.volume;
					this.isbn = book_ref.isbn;
					break;
					
				case "incollection":
					PublicationIncollection incollection_ref = (PublicationIncollection) newPublication;
					this.pages = incollection_ref.pages;
					break;
					
				case "phd thesis":
					PublicationPHDThesis phd_ref = (PublicationPHDThesis) newPublication;
					this.series = phd_ref.series;
					this.isbn = phd_ref.isbn;
					this.pages = phd_ref.pages;
					this.volume = phd_ref.volume;
					this.number = phd_ref.number;
					break;
					
				case "masters thesis":
					break;
					
				case "www":
					break;
			
				default:
					break;
			}
			
			// = Other attributes
			// formatted authors
			for (String author : this.authors) {
				this.formattedAuthors += author + "; ";
			}
			this.formattedAuthors = this.formattedAuthors.trim();
			// formatted editors
			for (String editor : this.editors) {
				this.formattedEditors += editor + "; ";
			}
			this.formattedEditors = this.formattedEditors.trim();
		}
	}
	
	// = GETTERS
	
	// Generic attributes
	public String getId() { return this.id; }
	public String getType() { return this.type; }
	public String getTitle() { return this.title; }
	public List<String> getAuthors() { return this.authors; }
	public List<String> getEditors() { return this.editors; }
	public String getYear() { return this.year; }
	public String getVenue() { return this.venue; }
	public List<String> getUrls() { return this.urls; }
	public List<String> getCites() { return this.cites; }
	public String getPrice() { return this.price; }
	
	// Publication specific attributes
	public String getRating() { return this.rating; }
	public String getNumber() { return this.number; }
	public String getPages() { return this.pages; }
	public String getVolume() { return this.volume; }
	public String getPublisher() { return this.publisher; }
	public String getIsbn() { return this.isbn; }
	public String getSeries() { return this.series; }
	
	public String getFormattedAuthors() { return this.formattedAuthors;	}
	public String getFormattedEditors() { return this.formattedEditors; }
		
}
