package js.npm.ckeditor.engine.view;

import haxe.extern.EitherType;

/** An item is a `Node` or a `TextProxy`. **/
typedef Item = EitherType<Node, TextProxy>;
