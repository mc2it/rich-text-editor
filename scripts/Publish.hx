//! --class-path src --library tink_cli --library tink_core
import Sys.*;
import Tools.compress;
import mc2it_rte.cli.Version.*;

/** Runs the script. **/
function main() {
	command("lix Dist");
	compress(["CHANGELOG.md", "LICENSE.md", "README.md", "haxelib.json", "lib", "run.n", "src"], "var/haxelib.zip");
	command("haxelib submit var/haxelib.zip");

	final tag = 'v${getPackageVersion()}';
	for (action in ["tag", "push origin"]) command('git $action $tag');
}
