/*
 * This class represents the specific publication of type "Proceedings"
 */
package edu.unsw.comp9321;

public class PublicationProceedings extends Publication {
	
	public String isbn = "";
	public String publisher = "";
	public String series = "";
	public String volume = "";
	public String number = "";
	
	public PublicationProceedings() {
		super();
		this.type = "conference (proceedings)";
	}
	
	public void showDetails() {
		super.showDetails();
		System.out.println("* ISBN: " + this.isbn);
		System.out.println("* Publisher: " + this.publisher);
		System.out.println("* Series: " + this.series);
		System.out.println("* Volume: " + this.volume);
		System.out.println("* Number: " + this.number);
	}

}
