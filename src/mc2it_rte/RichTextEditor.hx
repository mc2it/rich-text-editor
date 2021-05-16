package mc2it_rte;

import haxe.extern.EitherType;
import js.ckeditor.core.editor.EditorConfig;
import js.ckeditor.editor_classic.ClassicEditor;
import js.html.HtmlElement;
import js.lib.Promise;

/** An implementation of a rich text editor. **/
@:native("RichTextEditor")
extern class RichTextEditor extends ClassicEditor {

	/** Creates a new rich text editor. **/
	static function create(sourceElementOrData: EitherType<HtmlElement, String>, ?config: EditorConfig): Promise<RichTextEditor>;
}
