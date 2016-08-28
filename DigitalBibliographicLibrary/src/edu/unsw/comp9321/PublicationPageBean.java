/*
 * This class represents the model that will be
 * used by the publication page (for viewing a particular publication)
 */
package edu.unsw.comp9321;

public class PublicationPageBean {
	// Only contains the publication info
	public PublicationBean publication;
	
	// Constructor given a publication object
	public PublicationPageBean(Publication pub) {
		this.publication = new PublicationBean(pub);
	}
	
	// getters
	public PublicationBean getPublication() { return this.publication; }
}
