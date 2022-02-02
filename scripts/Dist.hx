/** Runs the script. **/
function main() {
	for (script in ["Clean", "Version", "Build"]) Sys.command('lix $script');
	Sys.command("npx terser --comments=false --config-file=etc/terser.json --output=lib/mc2it_rte.js lib/mc2it_rte.js");
}
