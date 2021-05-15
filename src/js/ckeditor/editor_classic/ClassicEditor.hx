package js.ckeditor.editor_classic;

import js.html.HtmlElement;
import js.lib.Promise;
import js.ckeditor.core.editor.Editor;
import js.ckeditor.core.editor.EditorConfig;
import js.ckeditor.core.editor.EditorWithUI;

/** The classic editor implementation. **/
@:jsRequire("@ckeditor/ckeditor5-editor-classic/src/classiceditor.js", "default")
extern class ClassicEditor extends Editor implements EditorWithUI {

	/** The editor UI instance. **/
	final ui: ClassicEditorUI;

	/** Creates a new classic editor. **/
	static function create(sourceElementOrData: EitherType<HtmlElement, String>, ?config: EditorConfig): Promise<ClassicEditor>;
}
