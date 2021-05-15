package mc2it_rte;

/** TODO **/
@:noDoc class Program {

	/** Output usage information. **/
	public var help = false;

	/** Output the version number. **/
	public var version = false;

	/** Creates a new program. **/
	public function new() {}

	/** Application entry point. **/
	public static function main() Cli.process(Sys.args(), new Program()).handle(Cli.exit);

	/** <output> : The path to the output directory. **/
	@:defaultCommand
	public function run(rest: Rest<String>): Promise<Noise> {
		if (help || version) {
			Sys.println(help ? Cli.getDoc(this) : Version.getPackageVersion());
			return Noise;
		}

		final requiredArgs = 1;
		if (rest.length < requiredArgs || (Sys.getEnv("HAXELIB_RUN") == "1" && rest.length < requiredArgs + 1))
			return new Error(BadRequest, "You must provide the path of the output directory.");

		return Noise;
	}
}
