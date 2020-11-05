package js.npm.ckeditor.engine.view;

import haxe.DynamicAccess;

/** A view downcast writer. **/
@:jsRequire("@ckeditor/ckeditor5-engine/src/view/downcastwriter.js", "default")
extern class DowncastWriter {

	/** Creates a new container element. **/
	function createContainerElement(name: String, ?attributes: DynamicAccess<Any>): ContainerElement;

	/** Creates a position at the given location. **/
	function createPositionAt(itemOrPosition: Node, offset: EitherType<Int, String>): Position;

	/** Creates a new text node. **/
	function createText(data: String): Text;

	/** Inserts one node or several nodes at the specified position. **/
	function insert(position: Position, nodes: Text): Range;
}
