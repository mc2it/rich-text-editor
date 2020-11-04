package js.npm.ckeditor.core.editor;

import haxe.extern.EitherType;
import haxe.extern.Rest;
import js.lib.Promise;
import js.npm.ckeditor.engine.controller.EditingController;
import js.npm.ckeditor.engine.conversion.Conversion;
import js.npm.ckeditor.engine.model.Model;
import js.npm.ckeditor.utils.Locale;

/** The class representing a basic, generic editor. **/
@:jsRequire("@ckeditor/ckeditor5-core/src/editor/editor.js", "default")
extern class Editor {

	/** The commands registered to the editor. **/
	final commands: CommandCollection;

	/** The conversion manager through which you can register model-to-view and view-to-model converters. **/
	final conversion: Conversion;

	/** The editing controller. **/
	final editing: EditingController;

	/** The locale instance. **/
	final locale: Locale;

	/** The editor's model. **/
	final model: Model;

	/** Destroys the editor instance, releasing all resources used by it. **/
	function destroy(): Promise<Dynamic>;

	/** Executes the specified command with given parameters. **/
	function execute(name: String, arguments: Rest<Any>): Dynamic;

	/** Puts the focus in the editor's editing view. **/
	function focus(): Void;

	/** Gets the data in the editor. **/
	function getData(?options: {?rootName: String, ?trim: String}): String;

	/** Sets the data in the editor. **/
	function setData(data: String): Void;

	/** Translates the given message to the UI language. **/
	function t(message: String, ?values: EitherType<String, EitherType<Float, EitherType<Int, Array<EitherType<String, EitherType<Float, Int>>>>>>): String;
}
