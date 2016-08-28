/*
 * This class represents the specific publication of type "Inproceedings"
 * more commonly known as "conference"
 */

package edu.unsw.comp9321;

public class PublicationInproceedings extends Publication {
	public String pages = "";
	public String number = "";
	
	public PublicationInproceedings() {
		super();
		this.type = "conference (inproceedings)";
	}
	
	public void showDetails() {
		super.showDetails();
		System.out.println("* Pages: " + this.pages);
		System.out.println("* Number: " + this.number);
	}
}
