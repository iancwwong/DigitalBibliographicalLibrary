/*
 * This class represents the specific publication of type "Incollection"
 */
package edu.unsw.comp9321;

public class PublicationIncollection extends Publication {
	public String pages = "";
	
	public PublicationIncollection() {
		super();
		this.type = "incollection";
	}
	
	public void showDetails() {
		super.showDetails();
		System.out.println("* Pages: " + this.pages);
	}
}
