//! --class-path src --library tink_cli
import Sys.*;
import mc2it_rte.cli.Version.*;

/** Runs the script. **/
function main() {
	command("lix Dist");
	Tools.compress(["CHANGELOG.md", "LICENSE.md", "README.md", "haxelib.json", "lib", "run.n", "src"], "var/haxelib.zip");
	command("haxelib submit var/haxelib.zip");
	for (action in ["tag", "push origin"]) command('git $action v$packageVersion');
}
