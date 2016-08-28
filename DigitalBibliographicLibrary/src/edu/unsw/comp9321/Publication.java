/*
 * This class contains the attributes for the general publication type
 */

package edu.unsw.comp9321;

import java.util.*;

public class Publication {
	public String id = "";
	public String type = "";									// type of publication
	public String title = "";
	public List<String> authors = new ArrayList<String>();
	public List<String> editors = new ArrayList<String>();
	public String year = "";
	public String venue = "";									// place published
	public List<String> urls = new ArrayList<String>();			// links to publication
	public List<String> cites = new ArrayList<String>();		// sources cited this publication
	public Double price = 0.00;
	
	// CONSTRUCTOR
	public Publication() {}
	
	// Show details
	public void showDetails() {
		// Preprocessing
		String pubAuthors = "";
		for (String author : this.authors){
			pubAuthors += author + "; ";
		}
		pubAuthors = pubAuthors.trim();
		
		System.out.println("== Details of publication");
		System.out.println("* Pub ID: " + this.id);
		System.out.println("* Type: " + this.type);
		System.out.println("* Title: " + this.title);
		System.out.println("* Authors: " + pubAuthors);
		System.out.println("* Num editors: " + this.editors.size());
		System.out.println("* Year: " + this.year);
		System.out.println("* Venue: " + this.venue);
		System.out.println("* Num links: " + this.urls.size());
		System.out.println("* Num cites: " + this.cites.size());
	}
	
    // Overriding equals() to compare two Complex objects
    @Override
    public boolean equals(Object obj) {
 
        if (obj == this) {
            return true;
        }
 
        if (!(obj instanceof Publication)) {
            return false;
        }
        
        // Two publications are equivalent if the ID's are the same       
        Publication other = (Publication) obj;  
        if (this.id.equals(other.id)){
        	return true;
        } else {
        	return false;
        }
    }
}
