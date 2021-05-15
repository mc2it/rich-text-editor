package js.ckeditor.engine.conversion;

/** A utility class that helps add converters to upcast and downcast dispatchers. **/
@:jsRequire("@ckeditor/ckeditor5-engine/src/conversion/conversion.js", "default")
extern class Conversion {

	/** Provides a chainable API to assign converters to conversion dispatchers group. **/
	@:native("for")
	function forGroup(groupName: String): EitherType<DowncastHelpers, UpcastHelpers>;
}
