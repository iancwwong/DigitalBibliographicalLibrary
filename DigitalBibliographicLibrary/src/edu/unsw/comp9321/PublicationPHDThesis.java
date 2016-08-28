/*
 * This class represents the specific publication of type 'phd thesis'
 */
package edu.unsw.comp9321;

public class PublicationPHDThesis extends Publication {
	public String series = "";
	public String isbn = "";
	public String pages = "";
	public String volume = "";
	public String number = "";
	
	public PublicationPHDThesis() {
		super();
		this.type = "phd thesis";
	}
	
	public void showDetails() {
		super.showDetails();
		System.out.println("* Series: " + this.series);
		System.out.println("* ISBN: " + this.isbn);
		System.out.println("* Pages: " + this.pages);
		System.out.println("* Volume: " + this.volume);
		System.out.println("* Number: " + this.number);
	}

}
