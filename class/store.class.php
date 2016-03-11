<?php

if( !class_exists( 'store')) {
	class store {
	        public $linkID;

		/*
			This passes the value of LinkID that stores the database connection
		*/

	        function __construct($linkID){ $this->linkID = $linkID; }

		/*
			This is a custom function I wrote so I won't have to keep calling linkID->query instead I call new_mysql($sql). This is a life saver on larger projects and if something ever changed
			on how MySQLi is called I would change it here only once instead of all over. Remember the mysql_query issue? Same idea.
		*/

	        public function new_mysql($sql) {
        	        $result = $this->linkID->query($sql) or die($this->linkID->error.__LINE__);
                	return $result;
	        }

		public function error($msg) {
			/*
				A universal error. Pass $msg and that will be displayed. The error is designed to stop the program if triggered
			*/

			print "$msg";
			die;
		}

		public function display_search() {
			// Note: On a larger project I would move my HTML to a template system like Smarty

			/*
				This displays the search form
			*/

			print "
			<form name=\"myform\">
			<table class=\"table\">
				<tr><td><input type=\"text\" name=\"search_string\" placeholder=\"Search by Type, Owner Name or Last Name, Phone, Eatery Name, City, State, or Zip Code\" 
				size=100 onkeypress=\"if(event.keyCode==13) { search(this.form); return false;}\">&nbsp;&nbsp;
				<input type=\"button\" value=\"Search\" class=\"btn btn-primary\" onclick=\"search(this.form)\"></td></tr>
			</table>
			</form>

			<div id=\"results\">


			</div>
			";

			/*
				The code below calls jquery and performs the search inside the results container
			*/

			?>
                        <script>
                        function search(myform) {
	                        $.get('search.php',
        	                $(myform).serialize(),
                	        function(php_msg) {
	                	        $("#results").html(php_msg);
	                        });
                        }
			</script>
			<?php
		}

		public function do_search() {
			/*
				The search combined all the fields using concat and does a like search. On a larger
				database this would most likely need to be done using a full text search instead
				of using a like search.
			*/
			$sql = "
			SELECT
				`e`.`Name`,
				`e`.`City`,
				`e`.`State`,
				`e`.`Zip`,
				`o`.`First`,
				`o`.`Last`,
				`o`.`Phone`,
				`t`.`Name` AS 'place_name'

			FROM
				`Eateries` e, `Owners` o, `Type` t

			WHERE
				`e`.`Type` = `t`.`id`
				AND `e`.`Owner` = `o`.`id`
				AND concat_ws(`e`.`Name`,`e`.`City`,`e`.`State`,`e`.`Zip`,`o`.`First`,`o`.`Last`,`o`.`Phone`,`t`.`Name`) LIKE '%$_GET[search_string]%'
			";

			// query is ran and results displayed

			$result = $this->new_mysql($sql);
			while ($row = $result->fetch_assoc()) {
				print "
				<ul>
					<li>$row[Name]:
						<ul>
							<li>Owned by: $row[First] $row[Last] | Phone: $row[Phone]</li>
							<li>Located in: $row[City], $row[State] $row[Zip]</li>
						</ul>
					</li>
				</ul>
				";
				$found = "1";
			}
			if ($found != "1") {
				print "<br>No results found.<br>";
			}



		}

	}
}
?>
