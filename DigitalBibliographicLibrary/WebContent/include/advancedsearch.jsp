<div class="container" style="width:700px">
  <form class="form-horizontal">
  
    <div class="form-group">
      <label class="control-label col-sm-2" for="title">Title:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="title" name="searchTitle">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="type">Type:</label>
      <div class="col-sm-10">
        <select class="selectpicker form-control" id="type" name="searchType">
        	<option selected value=""></option>
            <option>journal</option>
            <option>conference (inproceedings)</option>
            <option>conference (proceedings)</option>
            <option>book</option>
            <option>incollection</option>
            <option>phd thesis</option>
            <option>masters thesis</option>
            <option>www</option>
        </select>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="authors">Author(s):</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="authors" name="searchAuthors" placeholder="e.g Person A; Person B">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="editors">Editor(s):</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="editors" name="searchEditors" placeholder="e.g Person A; Person B">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="year">Year:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="year" name="searchYear">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="venue">Venue:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="venue" name="searchVenue">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="volume">Volume:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="volume" name="searchVolume">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="number">Number:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="number" name="searchNumber">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="pages">Pages:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="pages" name="searchPages" placeholder="e.g 245-252">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="publisher">Publisher:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="publisher" name="searchPublisher">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="isbn">ISBN:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="isbn" name="searchISBN">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="series">Series:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="series" name="searchSeries">
      </div>
    </div>

    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
		<input type='hidden' name="action" value="searchAdvancedFields"/>
        <button type="submit" class="btn btn-primary">
	    Search
	    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
        </button>
      </div>
    </div>
  </form>
</div>        