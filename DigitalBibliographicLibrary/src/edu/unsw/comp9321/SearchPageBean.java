/*
 * This class represent the model for the search results page
 */
package edu.unsw.comp9321;
import java.util.*;

public class SearchPageBean {
	public List<PublicationBean> results = new ArrayList<PublicationBean>();
	
	// Constructor given a list of publications
	public SearchPageBean(List<Publication> searchPublications) {
		if (searchPublications != null) {
			for (Publication publication : searchPublications) {
				PublicationBean pb = new PublicationBean(publication);
				this.results.add(pb);
			}
		}
	}
	
	// getters
	public List<PublicationBean> getResults() { return this.results; }
}
