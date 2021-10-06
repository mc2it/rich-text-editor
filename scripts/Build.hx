import Sys.*;

/** Runs the script. **/
function main() {
	final debug = args().contains("--debug");
	final flag = debug ? "--debug" : "";
	for (file in ["build", "run"]) command('haxe $flag $file.hxml');
	command('npx webpack --config=etc/webpack.js --mode=${debug ? "development" : "production"}');
}
