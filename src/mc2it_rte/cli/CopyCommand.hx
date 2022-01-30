package mc2it_rte.cli;

import sys.FileSystem;
import sys.io.File;
using haxe.io.Path;

/** Copy the library assets to a given directory. **/
class CopyCommand {

	/** Output usage information. **/
	public var help = false;

	/** Creates a new `copy` command. **/
	public function new() {}

	/** <directory> : The path to the output directory. **/
	@:defaultCommand
	public function run(rest: Rest<String>): Promise<Noise> {
		if (help) return { Sys.println(Cli.getDoc(this)); Noise; };

		final haxelibRun = Sys.getEnv("HAXELIB_RUN") == "1";
		final requiredArgs = 1;
		if (rest.length < requiredArgs || (haxelibRun && rest.length < requiredArgs + 1))
			return new Error(BadRequest, "You must provide the path of the output directory.");

		final input = Path.join([Sys.programPath().directory(), "lib"]);
		final output = rest[0].isAbsolute() ? rest[0] : Path.join([haxelibRun ? rest[rest.length - 1] : Sys.getCwd(), rest[0]]);
		copyDirectory(Path.join([input, "i18n"]), Path.join([output, "i18n"]));
		File.copy(Path.join([input, "mc2it_rte.js"]), Path.join([output, "mc2it_rte.js"]));
		return Noise;
	}

	/** Recursively copies all files in the specified `source` directory to a given `destination` directory. **/
	static function copyDirectory(source: String, destination: String) for (entry in FileSystem.readDirectory(source)) {
		final input = Path.join([source, entry]);
		final output = Path.join([destination, entry]);
		if (FileSystem.isDirectory(input)) copyDirectory(input, output);
		else {
			FileSystem.createDirectory(output.directory());
			File.copy(input, output);
		}
	}
}
