package ckeditor.engine.model;

import ckeditor.engine.model.Selection.Selectable;

/** The editor's data model. **/
@:jsRequire("@ckeditor/ckeditor5-engine/src/model/model.js", "default")
extern class Model {

	/** The model's document. **/
	final document: Document;

	/** The model's schema. **/
	final schema: Schema;

	/** The primary way of changing the model. **/
	@:overload(function(callback: Dynamic -> Dynamic): Dynamic {})
	function change(callback: Dynamic -> Void): Void;

	/** Inserts content at the position in the editor specified by the selection, as one would expect the paste functionality to work. **/
	function insertContent(content: EitherType<DocumentFragment, Item>, ?selectable: Selectable, ?placeOrOffset: EitherType<Int, String>): Void;
}
