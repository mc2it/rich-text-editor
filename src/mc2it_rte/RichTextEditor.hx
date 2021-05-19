package mc2it_rte;

import ckeditor.core.editor.EditorConfig;
import ckeditor.editor_classic.ClassicEditor;
import haxe.extern.EitherType;
import js.html.Element;
import js.lib.Promise;

/** An implementation of a rich text editor. **/
@:native("RichTextEditor")
extern class RichTextEditor extends ClassicEditor {

	/** Creates a new rich text editor. **/
	static function create(sourceElementOrData: EitherType<Element, String>, ?config: EditorConfig): Promise<RichTextEditor>;
}
