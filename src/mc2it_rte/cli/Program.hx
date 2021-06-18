package mc2it_rte.cli;

/** Command line interface of MC2IT Rich Text Editor. **/
class Program {

	/** Create a custom build to a given file. **/
	@:command
	public final build = new BuildCommand();

	/** Copy the library assets to a given directory. **/
	@:command
	public final copy = new CopyCommand();

	/** Output usage information. **/
	public var help = false;

	/** Print the path to the library assets. **/
	@:command
	public final libpath = new LibpathCommand();

	/** Output the version number. **/
	public var version = false;

	/** Creates a new program. **/
	public function new() {}

	/** Application entry point. **/
	static function main() Cli.process(Sys.args(), new Program()).handle(Cli.exit);

	// Runs this command.
	@:defaultCommand
	public function run() {
		Sys.println(version ? Version.getPackageVersion() : Cli.getDoc(this));
		return Promise.NOISE;
	}
}
