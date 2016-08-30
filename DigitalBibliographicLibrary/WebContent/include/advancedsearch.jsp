<div id="advancedSearch" class="container">

	<%-- Offer different types of publications --%>
	<form class="form-horizontal">
		<div class="form-group">
			<label for="typeSelect">Type:</label>
			<select class="form-control" id="typeSelect">
				<option onClick="openSearchOptions('')" selected></option>
				<option onclick="openSearchOptions('journal')">Journal</option>
				<option onclick="openSearchOptions('inproceedings')">Conference (Inproceedings)</option>
				<option onclick="openSearchOptions('proceedings')">Conference (Proceedings)</option>
				<option onclick="openSearchOptions('book')">Book</option>
				<option onclick="openSearchOptions('incollection')">Incollection</option>
				<option onclick="openSearchOptions('phdthesis')">PHD Thesis</option>
				<option onclick="openSearchOptions('mastersthesis')">Masters Thesis</option>
				<option onclick="openSearchOptions('www')">WWW</option>
			</select>
		</div>
	</form>
	<br/>
	
	<%-- Specific search options are presented here --%>
	<div class="container">
		<p id="advancedSearchOptions"></p>
	</div>

</div>
                        