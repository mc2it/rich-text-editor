package js.npm.ckeditor.core.editor;

import js.npm.ckeditor.engine.conversion.Conversion;
import js.npm.ckeditor.engine.model.Model;
import js.npm.ckeditor.utils.Locale;

/** The class representing a basic, generic editor. **/
@:jsRequire("@ckeditor/ckeditor5-core/src/editor/editor.js", "default")
extern class Editor {

	/** The conversion manager through which you can register model-to-view and view-to-model converters. **/
	final conversion: Conversion;

	/** The locale instance. **/
	final locale: Locale;

	/** The editor's model. **/
	final model: Model;
}
