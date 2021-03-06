<div class="container" >
	<div class="row">
		<div class="col-md-12">
            <div class="input-group" id="searchBar">
            	<form class="form-horizontal" role="form" action='control' method='POST'>
                <div class="input-group-btn">
                    <input type="text" class="form-control" name="searchTitle" placeholder="Enter title" />
                    <div class="btn-group" role="group">
                        <div class="dropdown dropdown-lg">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="caret"></span></button>
                            <div class="dropdown-menu dropdown-menu-right" role="menu">
                                  <div class="form-group">
                                    <label for="contain">Author(s)</label>
                                    <input class="form-control" type="text" name="searchAuthors" />
                                  </div>
                                  <div class="form-group">
                                    <label for="contain">Type</label>
                                    <input class="form-control" type="text" name="searchType"/>
                                  </div>
                                  <div class="form-group">
                                    <label for="contain">Year</label>
                                    <input class="form-control" type="text" name="searchYear"/>
                                  </div>
                                  <div class="form-group">
                                    <label for="contain">Venue</label>
                                    <input class="form-control" type="text" name="searchVenue"/>
                                  </div>
                                
                            </div>
                        </div>
                        <input type='hidden' name="action" value="searchBasicFields"/>
                        <button type="submit" class="btn btn-primary">
                        	<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>
                    </div>
                </div>
                </form>
            </div>
          </div>
        </div>
	</div>
