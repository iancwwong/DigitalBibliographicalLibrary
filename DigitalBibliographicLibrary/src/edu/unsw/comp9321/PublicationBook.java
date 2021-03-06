/*
 * This class represents the specific publication of type "Book"
 */
package edu.unsw.comp9321;

public class PublicationBook extends Publication {
	public String pages = "";
	public String publisher = "";
	public String isbn = "";
	public String series = "";
	public String volume = "";
	
	public PublicationBook() {
		super();
		this.type = "book";
	}
	
	public void showDetails() {
		super.showDetails();
		System.out.println("* Pages: " + this.pages);
		System.out.println("* Publisher: " + this.publisher);
		System.out.println("* ISBN: " + this.isbn);
		System.out.println("* Series: " + this.series);
		System.out.println("* Volume: " + this.volume);
	}
}
