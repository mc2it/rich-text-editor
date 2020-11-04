package js.npm.ckeditor.core;

import js.npm.ckeditor.core.editor.Editor;

/** The base class for CKEditor plugins. **/
@:jsRequire("@ckeditor/ckeditor5-core/src/plugin.js", "default")
extern class Plugin {

	/** The editor instance. **/
	final editor: Editor;
}
