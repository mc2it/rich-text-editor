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

		final code = [File.getContent(Path.join([Sys.getCwd(), "lib/mc2it_rte.js"]))]
			.concat(getLanguageFiles().map(File.getContent))
			.join("\n");

		FileSystem.createDirectory(rest[0]);
		File.saveContent(Path.join([rest[0], "mc2it_rte.js"]), code);
		return Noise;
	}

	/** Returns the file paths corresponding to the provided languages. **/
	function getLanguageFiles() {
		if (languages.length == 0) return [];

		final i18nPath = Path.join([Sys.getCwd(), "lib/i18n"]);
		final files = languages == "all"
			? FileSystem.readDirectory(i18nPath).map(file -> file.withoutExtension())
			: languages.split(",").map(language -> language.toLowerCase());

		return files.map(file -> Path.join([i18nPath, '$file.js'])).filter(FileSystem.exists);
	}
}
