package js.npm.ckeditor.engine.model;

/** A position in the model tree. **/
@:jsRequire("@ckeditor/ckeditor5-engine/src/model/position.js", "default")
extern class Position {

	/** The parent element of this position. **/
	final parent: EitherType<DocumentFragment, Element>;
}
