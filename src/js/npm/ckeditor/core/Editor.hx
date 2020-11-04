package js.npm.ckeditor.core;

import js.npm.ckeditor.engine.Conversion;
import js.npm.ckeditor.engine.Model;

/** The class representing a basic, generic editor. **/
@:jsRequire("@ckeditor/ckeditor5-core/src/editor/editor.js", "default")
extern class Editor {

	/** The conversion manager through which you can register model-to-view and view-to-model converters. **/
	final conversion: Conversion;

	/** The editor's model. **/
	final model: Model;
}
