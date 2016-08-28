/*
 * This class represents the model for the cart view page
 */
package edu.unsw.comp9321;

public class CartPageBean {
	public Cart cart = new Cart();
	
	public CartPageBean() {}
	
	// getters
	public Cart getCart() { return this.cart; }
}
