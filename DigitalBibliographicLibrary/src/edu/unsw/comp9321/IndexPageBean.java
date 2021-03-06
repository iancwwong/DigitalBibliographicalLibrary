/*
 * This class represents the model that will be used in the index page
 */
package edu.unsw.comp9321;

import java.util.*;

public class IndexPageBean {
	public List<PublicationBean> publications = new ArrayList<PublicationBean>();
	
	// CONSTRUCTOR
	public IndexPageBean(List<Publication> newPublications) {
		for (Publication publication : newPublications) {
			PublicationBean pb = new PublicationBean(publication);
			this.publications.add(pb);
		}
	}
	
	// Getters
	public List<PublicationBean> getPublications() { return this.publications; }
}
