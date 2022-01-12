package mc2it_rte.cli;

import sys.FileSystem;
import sys.io.File;

using haxe.io.Path;

/** Create a custom build to a given file. **/
class BuildCommand {

	/** Output usage information. **/
	public var help = false;

	/** A comma separated list of languages to embed. **/
	public var languages = "";

	/** Creates a new `copy` command. **/
	public function new() {}

	/** <file> : The path to the output file. **/
	@:defaultCommand
	public function run(rest: Rest<String>): Promise<Noise> {
		if (help) return { Sys.println(Cli.getDoc(this)); Noise; };

		final haxelibRun = Sys.getEnv("HAXELIB_RUN") == "1";
		final requiredArgs = 1;
		if (rest.length < requiredArgs || (haxelibRun && rest.length < requiredArgs + 1))
			return new Error(BadRequest, "You must provide the path of the output file.");

		final output = rest[0].isAbsolute() ? rest[0] : Path.join([haxelibRun ? rest[rest.length - 1] : Sys.getCwd(), rest[0]]);
		FileSystem.createDirectory(output.directory());

		final files = [File.getContent(Path.join([Sys.programPath().directory(), "lib/mc2it_rte.js"]))].concat(getLanguageFiles().map(File.getContent));
		File.saveContent(output, files.join("\n"));
		return Noise;
	}

	/** Returns the file paths corresponding to the provided languages. **/
	function getLanguageFiles() {
		if (languages.length == 0) return [];

		final input = Path.join([Sys.programPath().directory(), "lib/i18n"]);
		final fileNames = languages == "all" ? FileSystem.readDirectory(input) : languages.split(",").map(language -> language.toLowerCase());
		return fileNames.map(fileName -> Path.join([input, fileName.withExtension("js")])).filter(FileSystem.exists);
	}
}
