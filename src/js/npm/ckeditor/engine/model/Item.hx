package js.npm.ckeditor.engine.model;

import haxe.extern.EitherType;

/** An item is a `Node` or a `TextProxy`. **/
typedef Item = EitherType<Node, TextProxy>;
