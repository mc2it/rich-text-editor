package mc2it_rte.cli;

import sys.FileSystem;
import sys.io.File;
import tink.Cli;
import tink.cli.Rest;

using haxe.io.Path;

/** Copy the library assets to a given directory. **/
class CopyCommand {

	/** Output usage information. **/
	public var help = false;

	/** A comma separated list of languages to embed. **/
	public var languages = "";

	/** Creates a new `copy` command. **/
	public function new() {}

	/** <directory> : The path to the destination directory. **/
	@:defaultCommand
	public function run(rest: Rest<String>): Promise<Noise> {
		if (help) return { Sys.println(Cli.getDoc(this)); Noise; };

		final requiredArgs = 1;
		if (rest.length < requiredArgs || (Sys.getEnv("HAXELIB_RUN") == "1" && rest.length < requiredArgs + 1))
			return new Error(BadRequest, "You must provide the path of the output directory.");

		final libPath = Path.join([Sys.getCwd(), "lib"]);
		var code = File.getContent(Path.join([libPath, "mc2it_rte.js"]));
		for (language in getLanguageFiles()) code += File.getContent(Path.join([libPath, 'i18n/$language.js']));

		FileSystem.createDirectory(rest[0]);
		File.saveContent(Path.join([rest[0], "mc2it_rte.js"]), code);
		return Noise;
	}

	/** Returns the paths of the files corresponding to the selected languages. **/
	function getLanguageFiles() {
		return [];
	}
}
