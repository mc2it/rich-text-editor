package js.npm.ckeditor.core.editor;

import haxe.extern.EitherType;

/** The CKEditor configuration options. **/
typedef EditorConfig = {

	/** The list of additional plugins to load along those already available in the editor build. **/
	var ?extraPlugins: Array<Class<Plugin>>;

	/** The initial editor data to be used instead of the provided element's HTML content. **/
	var ?initialData: String;

	/** The language of the editor UI and its content. **/
	var ?language: EitherType<String, {content: String, ui: String}>;

	/** Specifies the text displayed in the editor when there is no content (the editor is empty). **/
	var ?placeholder: String;

	/** The list of plugins to load. **/
	var ?plugins: Array<EitherType<String, Class<Plugin>>>;

	/** The list of plugins which should not be loaded despite being available in an editor build. **/
	var ?removePlugins: Array<String>;

	/** The editor toolbar configuration. **/
	var ?toolbar: EitherType<Array<String>, {
		items: Array<String>,
		?shouldNotGroupWhenFull: Bool,
		?viewportTopOffset: Int
	}>;
}
