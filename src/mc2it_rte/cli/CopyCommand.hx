package mc2it_rte.cli;

import sys.FileSystem;
import sys.io.File;

using Lambda;
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

		final output = rest[0].isAbsolute() ? rest[0] : Path.join([haxelibRun ? rest[rest.length - 1] : Sys.getCwd(), rest[0]]);
		FileSystem.createDirectory(Path.join([output, "i18n"]));

		final libDir = Path.join([Sys.getCwd(), "lib"]);
		final files = ["mc2it_rte.js"].concat(FileSystem.readDirectory(Path.join([libDir, "i18n"])).map(file -> 'i18n/$file'));
		files.iter(file -> File.copy(Path.join([libDir, file]), Path.join([output, file])));
		return Noise;
	}
}
