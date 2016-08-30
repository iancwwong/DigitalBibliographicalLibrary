// This function displays the appropriate search options,
// depending on which type of publication is selected
function openSearchOptions(publicationType) {
	var advancedSearchOptions = document.getElementById("advancedSearchOptions");
	
	// Empty the fields if empty publication type selected
	if (publicationType === "") {
		advancedSearchOptions.innerHTML = "";
		return;
	}
	
	// Prepare the form
	advancedSearchOptions.innerHTML += '<form class="form-horizontal">';
	
	// ADD PUBLICATION TYPE SPECIFIC SEARCH FIELDS
	switch(publicationType) {
		case "journal":
			break;
			
		default:
			break;
	
	}
	
	// Add submit button
	advancedSearchOptions.innerHTML += '<div class="form-group">'
										+ '<div>'
											+ '<input type="hidden" name="action" value="searchAdvancedFields"/>'
											+ '<button type="submit" class="btn btn-primary">'
											+ 'Search&nbsp;'
											+ '<span class="glyphicon glyphicon-search" aria-hidden="true"></span>'
											+ '</button>'
										+ '</div>'
									+	'</div>';
	
	// Close form
	advancedSearchOptions.innerHTML += '</form>';
}
