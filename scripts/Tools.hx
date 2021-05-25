import haxe.io.Path.*;
import sys.FileSystem.*;

/** Recursively deletes all files in the specified `directory`. **/
function cleanDirectory(directory: String) for (entry in readDirectory(directory).filter(entry -> entry != ".gitkeep")) {
	final path = join([directory, entry]);
	if (isDirectory(path)) removeDirectory(path);
	else deleteFile(path);
}

/** TODO **/
function compress(sources: Array<String>, destination: String) {
	// TODO
}

/** Recursively deletes the specified `directory`. **/
function removeDirectory(directory: String) {
	cleanDirectory(directory);
	deleteDirectory(directory);
}

/* TODO
function compressFile(path: String, deleteSource = true) {
	final bytes = File.getBytes(path);
	final entry: Entry = {
		compressed: false,
		crc32: Crc32.make(bytes),
		data: bytes,
		dataSize: bytes.length,
		fileName: path.withoutDirectory(),
		fileSize: bytes.length,
		fileTime: Date.now()
	};

	final entries = new List<Entry>();
	entry.compress(9);
	entries.push(entry);

	final output = File.write('${path.withoutExtension()}.zip');
	new Writer(output).write(entries);
	output.close();

	if (deleteSource) FileSystem.deleteFile(path);
}*/
