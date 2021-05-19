package ckeditor.editor_classic;

import ckeditor.core.editor.Editor;
import ckeditor.core.editor.EditorConfig;
import ckeditor.core.editor.EditorWithUI;
import js.html.HtmlElement;
import js.lib.Promise;

/** The classic editor implementation. **/
@:jsRequire("@ckeditor/ckeditor5-editor-classic/src/classiceditor.js", "default")
extern class ClassicEditor extends Editor implements EditorWithUI {

	/** The editor UI instance. **/
	final ui: ClassicEditorUI;

	/** Creates a new classic editor. **/
	static function create(sourceElementOrData: EitherType<HtmlElement, String>, ?config: EditorConfig): Promise<ClassicEditor>;
}
