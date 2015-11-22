<?php
	require_once("scss.inc.php");
	require_once("sass-compiler.php");

	// function for usort comparison
	function get_priority($a, $b) {
		// priority table for initial sorting
		$priority_table = [
			"overrides" => 3,
			"global" => 2,
			"content" => 1
		];

		// get ranks of $a and $b
		$rank_a = 0; $rank_b = 0;
		foreach($priority_table as $name => $rank) {
			if ($a["name"] == $name) {
				$rank_a = $rank;
			}
			if ($b["name"] == $name) {
				$rank_b = $rank;
			}
		}

		// compare
		if ($rank_a == $rank_b) {
			$cmp = strcasecmp($a["name"], $b["name"]);
			if ($cmp == 0) {
				return 0;
			} else if ( $cmp < 0) {
				return -1;
			} else {
				return 1;
			}
		}

		return ($rank_a < $rank_b) ? 1 : -1;
	}

	// function for fetching sort sequence
	function get_sort_sequence($files) {
		$sort_sequence = "";
		foreach ($files as $file) {
			$sort_sequence .= $file["name"] . ",";
		}
		return substr($sort_sequence, 0, -1);
	}

	// define functions for actions
	function purge() {
		$files = glob("css/*.css");
		foreach ($files as $file) {
			if (is_file($file)) {
				unlink($file);
			}
		}
	}

	function combine() {
		$app_css = fopen("app.css", "w");

		// fetch sort sequence
		if (isset($_POST["sort_sequence"])) {
			$sequence = explode(",", $_POST["sort_sequence"]);
		} else {
			function format_name($str) {
				return ["name" => substr($str, 4, -4)];
			}

			$files = array_map("format_name", glob("css/*.css"));
			$sequence = explode(",", get_sort_sequence($files));
		}

		// process sort sequence
		foreach ($sequence as $css) {
			if ($css != "") {
				$css_file = fopen("css/" . $css . ".css", "r");
				while($line = fgets($css_file)) {
					fwrite($app_css, $line);
				}
				fclose($css_file);

				fwrite($app_css, "\n");
			}
		}

		fclose($app_css);
	}

	// handle user actions through POST from SASS Manager
	if (isset($_POST["action"])) {
		if ($_POST["action"] == "cycle") {
			// perform complete cycle
			purge();
			SassCompiler::run("scss/", "css/", "scss_formatter_compressed");
			combine();
			purge();

			$message = [
				"type" => "success",
				"title" => "Cycle Complete",
				"body" => "All styles have been compiled and your new app.css is ready for use."
			];
		} else if ($_POST["action"] == "recompile") {
			// compile
			SassCompiler::run("scss/", "css/", "scss_formatter_nested");

			$message = [
				"type" => "success",
				"title" => "Compile Successful",
				"body" => "All SASS files have been recompiled."
			];
		} else if ($_POST["action"] == "recompileminify") {
			// compile and minify
			SassCompiler::run("scss/", "css/", "scss_formatter_compressed");

			$message = [
				"type" => "success",
				"title" => "Compile and Minify Successful",
				"body" => "All SASS files have been recompiled and minified."
			];
		} else if ($_POST["action"] == "purge") {
			// delete all compiled css files
			purge();

			$message = [
				"type" => "success",
				"title" => "Purge Successful",
				"body" => "All previously compiled CSS files have been deleted."
			];
		} else if ($_POST["action"] == "combine") {
			// combine specified files
			if (isset($_POST["sort_sequence"])) {
				combine();

				$message = [
					"type" => "success",
					"title" => "Merge Successful",
					"body" => "A new app.css file has been generated."
				];
			} else {
				$message = [
					"type" => "error",
					"title" => "Missing Parameter",
					"body" => "The sort sequence hasn't been initialized. Please try again."
				];
			}
		} else {
			$message = [
				"type" => "error",
				"title" => "Invalid Action",
				"body" => "We didn't recognize what you wanted us to do. Care to try again? "
			];
		}
	}

	// handle automatic rebuild cycle from GET
	if (isset($_GET["action"]) && $_GET["action"] == "autocycle") {
		// perform complete cycle
		purge();
		SassCompiler::run("scss/", "css/", "scss_formatter_compressed");
		combine();
		purge();

		// return contents of app.css
		header("Content-Type: text/css");
		$file = fopen("app.css", "r");
		while ($line = fgets($file)) {
			print($line);
		}

		fclose($file);
	}

	// fetch all css files
	$files = [];
	foreach (glob("css/*.css") as $css) {
		$files[] = [
			"name" => substr($css, 4, -4),
			"timestamp" => date("j F Y, H:i:s", filemtime($css))
		];
	}

	// initial sorting of files
	usort($files, "get_priority");

	// get initial sort sequence
	$sort_sequence = get_sort_sequence($files);

?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>SASS Manager</title>
	<link rel="stylesheet" href="../../vendor/semantic/semantic.min.css">
</head>
<body>
	<div class="ui center aligned text container">
		<br><br><br>
		<h1>SASS Manager</h1>
		<div class="ui divider"></div>

		<!-- message block -->
		<?php if (isset($message)) { ?>
		<?php if (isset($message["type"]) && $message["type"] == "success") { ?>
			<div class="ui success icon message"
				style="position:fixed;top:0;left:0;right:0;background:transparent;
				background:linear-gradient(179deg,rgba(187,224,187,0.75),rgba(255,255,255,0));
				text-align:left;margin:0;border-radius:0;box-shadow:none;z-index:1000;">
				<i class="close icon"></i>
				<i class="checkmark icon"></i>
		<?php } else if (isset($message["type"]) && $message["type"] == "error") { ?>
			<div class="ui error icon message">
				<i class="close icon"></i>
				<i class="remove icon"></i>
		<?php } else { ?>
			<div class="ui info icon message">
				<i class="close icon"></i>
				<i class="info icon"></i>
		<?php } ?>

			<div class="content">
				<div class="header">
					<?php echo $message["title"]; ?>
				</div>
				<p><?php echo $message["body"]; ?></p>
			</div>
		</div>
		<?php } ?>

		<!-- actions -->
		<br>
		<div class="ui stackable centered grid container">
			<div class="row">
				<form action="" method="POST" class="sixteen wide column">
					<input type="hidden" name="action" value="cycle">
					<button class="ui huge green fluid labeled icon button">
						<i class="refresh icon"></i> Perform Complete Compilation Cycle
						<small style="opacity:0.5">Purge + Compile + Minify + Combine + Purge</small>
					</button>
				</form>
			</div>
			<div class="ui horizontal divider">
				<small><i class="settings icon"></i> Advanced Controls</small>
			</div>
			<div class="row">
				<form action="" method="POST" class="eight wide column">
					<input class="recompile-action" type="hidden" name="action" value="recompile">
					<button class="ui large blue fluid labeled icon button">
						<i class="repeat icon"></i>
						<?php if (count($files) == 0) { ?>
							Compile SASS
						<?php } else { ?>
							Recompile SASS
						<?php } ?>
					</button>
				</form>
				<form action="" method="POST" class="eight wide column">
					<input type="hidden" name="action" value="recompileminify">
					<button class="ui large blue fluid labeled icon button">
						<i class="refresh icon"></i>
						<?php if (count($files) == 0) { ?>
							Compile and Minify SASS
						<?php } else { ?>
							Recompile and Minify SASS
						<?php } ?>
					</button>
				</form>
			</div>
			<div class="row">
				<form action="" method="POST" class="sixteen wide column">
					<input type="hidden" name="action" value="purge">
					<button class="ui large orange fluid labeled icon button">
						<i class="trash icon"></i> Purge Compiled CSS Files
					</button>
				</form>
			</div>
			<div class="row">
				<form action="" method="POST" class="sixteen wide column">
					<input type="hidden" name="action" value="combine">
					<input class="sort-sequence" type="hidden" name="sort_sequence" value="<?php echo $sort_sequence; ?>">
					<div class="ui top attached secondary segment header">
						Merge compiled CSS to app.css
					</div>
					<div class="ui bottom attached secondary segment">
						<?php if (count($files) == 0) { ?>
						<div class="ui info icon message">
							<i class="info icon"></i>
							<div class="content">
								<div class="header">All Clean!</div>
								<p>
									There are currently no compiled CSS files.
									Use the controls above to compile SASS files.
								</p>
							</div>
						</div>
						<?php } else { ?>
						<div id="sortable-list" class="ui segments">
							<?php foreach ($files as $css) { ?>
							<div class="ui segment">
								<i class="sidebar icon handle" style="cursor:grab;"></i>
								<div class="ui checkbox">
									<input class="hidden" tabindex="0" type="checkbox" name="<?php echo $css; ?>" checked>
									<label>
										<span class="name">
											<?php echo $css["name"] . ".css"; ?>
										</span>
										<small style="color:#888888;">
											<?php echo $css["timestamp"]; ?>
										</small>
									</label>
								</div>
							</div>
							<?php } ?>
						</div>
						<?php } ?>

						<?php if (count($files) > 0) { ?>
						<button class="ui large green fluid labeled icon submit button">
							<i class="compress icon"></i> Combine
						</button>
						<?php } ?>
					</div>
				</form>
			</div>
		</div>

		<br>
		<div class="ui divider"></div>
		<small style="color:#888888;">
			<strong>SASS Manager</strong> &copy; VanillaBytes 2015
		</small>
		<br><br><br>
	</div>

	<script type="text/javascript" src="../vendor/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="../vendor/semantic/semantic.min.js"></script>
	<script type="text/javascript" src="../vendor/Sortable.min.js"></script>
	<script>
		// button loaders
		$(".ui.button").on("click", function(e) {
			$(this).addClass("loading");
		});

		// dismiss messages
		$(".message .close").on("click", function() {
			$(this)
				.closest(".message")
				.transition("fade");
		});

		// auto dismiss message
		setTimeout(function() {
			$(".message .close").click();
		}, 2000);

		// semantic elements
		$(".ui.checkbox").checkbox();

		// updating sort sequence field
		function updateSortSequence() {
			// fetch all active (checked) list items
			var sortSequence = "";
			$("#sortable-list div.checkbox").each(function() {
				if ($(this).hasClass("checked")) {
					var filename = $(this).find("label .name").text().trim();
					sortSequence += filename.substring(0, filename.length - 4) + ",";
				}
			});

			// update sort sequence field
			$(".sort-sequence").attr("value", sortSequence.substring(0, sortSequence.length - 1));
		}

		// update on checkbox click
		$(".ui.checkbox").on("click", function() {
			setTimeout(function() {
				updateSortSequence();
			}, 10);
		});

		// sortable list
		var list = document.getElementById("sortable-list");
		if (list) {
			var sortable = new Sortable.create(list, {
				animation: 490,
				handle: ".handle",
				onEnd: function() {
					setTimeout(function() {
						updateSortSequence();
					}, 50);
				}
			});
		}
	</script>
</body>
</html>