package mc2it_rte.cli;

import sys.FileSystem;
import sys.io.File;
import tink.Cli;
import tink.cli.Rest;

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

		final requiredArgs = 1;
		if (rest.length < requiredArgs || (Sys.getEnv("HAXELIB_RUN") == "1" && rest.length < requiredArgs + 1))
			return new Error(BadRequest, "You must provide the path of the output directory.");

		final libDir = Path.join([Sys.getCwd(), "lib"]);
		final files = ["mc2it_rte.js"].concat(FileSystem.readDirectory(Path.join([libDir, "i18n"])).map(file -> 'i18n/$file'));
		FileSystem.createDirectory(Path.join([rest[0], "i18n"]));
		files.iter(file -> File.copy(Path.join([libDir, file]), Path.join([rest[0], file])));
		return Noise;
	}
}
