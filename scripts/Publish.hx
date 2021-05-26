import Sys.*;
import Tools.compress;
import haxe.Json;
import sys.io.File.*;

/** Runs the script. **/
function main() {
	command("lix Dist");
	compress(["CHANGELOG.md", "LICENSE.md", "README.md", "haxelib.json", "lib", "run.n", "src"], "var/haxelib.zip");
	command("haxelib submit var/haxelib.zip");

	final tag = 'v${Json.parse(getContent("haxelib.json")).version}';
	for (action in ["tag", "push origin"]) command('git $action $tag');
}
