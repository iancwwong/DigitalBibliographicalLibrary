<!--  This file contains the information of the navigation bar -->
<!-- Navbar content -->
<div class="navbar-wrapper">

    <nav class="navbar navbar-inverse navbar-static-top">
      <div class="container">
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active">
				<form action='control' method='POST'>
					<input type='hidden' name="action" value="viewIndexPage"/>
					<button type="submit" class="btn btn-link">
						Home
					</button>
				</form>	
            </li>
            <li>
				<form action='control' method='POST'>
					<input type='hidden' name="action" value="viewAboutPage"/>
					<button type="submit" class="btn btn-link">
						About
					</button>
				</form>	
            </li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
          	<li>
				<form action='control' method='POST'>
					<input type='hidden' name="action" value="viewCartPage"/>
					<button type="submit" class="btn btn-link">
						<span class="glyphicon glyphicon-shopping-cart"></span>
						View Cart (${userBean.cart.numItems})
					</button>
				</form>	
          	</li>
          </ul>          
        </div>
      </div>
    </nav>

</div>