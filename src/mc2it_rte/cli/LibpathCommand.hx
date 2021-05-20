package mc2it_rte.cli;

import tink.Cli;

using StringTools;
using haxe.io.Path;

/** Print the path to the library assets. **/
class LibpathCommand {

	/** Output usage information. **/
	public var help = false;

	/** Creates a new `libpath` command. **/
	public function new() {}

	// Runs this command.
	@:defaultCommand
	public function run() {
		Sys.println(help ? Cli.getDoc(this) : Path.join([Sys.getCwd(), "lib"]).replace("/", Sys.systemName() == "Windows" ? "\\" : "/"));
		return Promise.NOISE;
	}
}
