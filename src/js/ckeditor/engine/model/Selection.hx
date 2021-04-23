package js.npm.ckeditor.engine.model;

/** An entity that is used to set selection. **/
typedef Selectable = EitherType<DocumentSelection, EitherType<Node, EitherType<Position, EitherType<Range, Selection>>>>;

/** A set of ranges. **/
@:jsRequire("@ckeditor/ckeditor5-engine/src/model/selection.js", "default")
extern class Selection {}
