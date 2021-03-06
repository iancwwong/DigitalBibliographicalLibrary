/*
 * This class represents a user's cart
 */
package edu.unsw.comp9321;
import java.text.DecimalFormat;
import java.util.*;

public class Cart {
	public List<PublicationBean> publications = new ArrayList<PublicationBean>();
	public int numItems = 0;
	public double totalPrice = 0.0;
	public String totalPriceFormatted = "0.0";
	
	// For converting price to 2dp format
	private DecimalFormat df = new DecimalFormat("#.00");
	
	// Constructor
	public Cart() {}
	
	// Add a particular publication, given as a Publication object
	public void addPublication(Publication pubToAdd) {
		// Convert publication to publicationBean for front-end presentation
		PublicationBean pb = new PublicationBean(pubToAdd);
		this.publications.add(pb);
		
		// Update total number of items
		this.numItems += 1;	
		
		// Update total price
		this.totalPrice += pubToAdd.price;
		this.totalPriceFormatted = "$" + df.format(this.totalPrice);
	}
	
	// Remove a set of publications, given their ID's
	public void removePublications(String[] pubIDs) {
		
		// If pubIDs empty, early exit
		if (pubIDs.length == 0) {
			return;
		}
		
		// Find each publication, and remove
		// NOTE: THIS IS A VERY HACKY WAY AT THE MOMENT!!
		List<PublicationBean> publicationsToRemove = new ArrayList<PublicationBean>();
		for (String pubID : pubIDs) {
			for (PublicationBean publication : this.publications) {
				if (publication.id.equals(pubID)) {
					publicationsToRemove.add(publication);
					continue;
				}
			}
		}
		for (PublicationBean publication : publicationsToRemove) {
			this.publications.remove(publication);
		}
		
		// Update total number of items
		this.numItems = this.publications.size();
		
		// Recalculate total price
		this.totalPrice = 0;
		for (PublicationBean pb : this.publications) {
			this.totalPrice += Double.parseDouble(pb.price.substring(1));	// strip the '$' sign
		}
		this.totalPriceFormatted = "$" + df.format(this.totalPrice);
	}
	
	// Getters
	public List<PublicationBean> getPublications() { return this.publications; }
	public int getNumItems() { return this.numItems; }
	public String getTotalPriceFormatted() { return this.totalPriceFormatted; }
}
