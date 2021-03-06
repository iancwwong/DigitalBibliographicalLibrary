/*
 * This class will represent the user's information
 */
package edu.unsw.comp9321;

import java.util.*;

public class UserBean {
	public String userID = "";
	public Cart cart = new Cart();
	
	// Constructor
	public UserBean(String newID) {
		this.userID = newID;
	}
	
	// Getters
	public String getUserID() { return this.userID; }
	public Cart getCart() { return this.cart; }
}
