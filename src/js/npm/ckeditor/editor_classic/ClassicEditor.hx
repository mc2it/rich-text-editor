package js.npm.ckeditor.editor_classic;

import haxe.extern.EitherType;
import js.html.HtmlElement;
import js.lib.Promise;
import js.npm.ckeditor.core.editor.Editor;
import js.npm.ckeditor.core.editor.EditorConfig;

@:jsRequire("@ckeditor/ckeditor5-editor-classic/src/classiceditor.js", "default")
extern class ClassicEditor extends Editor {

	/** Creates a new classic editor. **/
	static function create(sourceElementOrData: EitherType<HtmlElement, String>, ?config: EditorConfig): Promise<ClassicEditor>;
}
