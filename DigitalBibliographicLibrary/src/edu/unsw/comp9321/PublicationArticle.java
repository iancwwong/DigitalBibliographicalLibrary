/*
 * This class represents the specific publication of type "article", more commonly known
 * as "journal"
 */

package edu.unsw.comp9321;

public class PublicationArticle extends Publication{
	public String rating = "";
	public String number = "";
	public String pages = "";
	public String volume = "";
	
	public PublicationArticle() {
		super();
		this.type = "journal";
	}
	
	public void showDetails() {
		super.showDetails();
		System.out.println("* Rating: " + this.rating);
		System.out.println("* Number: " + this.number);
		System.out.println("* Pages: " + this.pages);
		System.out.println("* Volume: " + this.volume);
	}

}
