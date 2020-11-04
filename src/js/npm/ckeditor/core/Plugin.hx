package js.npm.ckeditor.core;

/** The base class for CKEditor plugin classes. **/
@:jsRequire("@ckeditor/ckeditor5-core/src/plugin.js", "default")
extern class Plugin {

	/** The editor instance. **/
	final editor: Editor;
}
