import haxe.Json;
import sys.io.File.*;

/** Runs the script. **/
function main() {
	final version = Json.parse(getContent("haxelib.json")).version;
	saveContent("package.json", ~/"version": "\d+(\.\d+){2}"/.replace(getContent("package.json"), '"version": "$version"'));
}
