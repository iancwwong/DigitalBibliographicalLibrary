<!-- search features -->
<h2>Search</h2>
<hr/>
<ul class="tab">
	<li><a href="#" class="tablinks active" onclick="openTab(event, 'basicSearch')">Basic</a></li>
	<li><a href="#" class="tablinks" onclick="openTab(event, 'advancedSearch')">Advanced</a></li>
</ul>

<div id="basicSearch" class="tabcontent">
	<%@ include file="searchbar.jsp"%>
</div>

<div id="advancedSearch" class="tabcontent">
	<%@ include file="advancedsearch.jsp"%>
</div>