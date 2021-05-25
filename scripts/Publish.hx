import Sys.*;
import haxe.Json;
import sys.io.File.*;

/** Runs the script. **/
function main() {
	command("lix Dist");

	final tag = 'v${Json.parse(getContent("haxelib.json")).version}';
	for (action in ["tag", "push origin"]) command('git $action $tag');
}
