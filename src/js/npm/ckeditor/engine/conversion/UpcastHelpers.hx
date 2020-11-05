package js.npm.ckeditor.engine.conversion;

import js.npm.ckeditor.engine.model.Element as ModelElement;
import js.npm.ckeditor.engine.view.Element as ViewElement;
import js.npm.ckeditor.engine.view.Matcher.MatcherPattern;

/** A utility class that helps add converters to upcast and downcast dispatchers. **/
@:jsRequire("@ckeditor/ckeditor5-engine/src/conversion/upcasthelpers.js", "default")
extern class UpcastHelpers extends ConversionHelpers {

	/** View element to model element conversion helper. **/
	function elementToElement(config: {
		model: EitherType<String, EitherType<ModelElement, (ViewElement, Dynamic) -> ModelElement>>,
		?converterPriority: String,
		?view: MatcherPattern
	}): UpcastHelpers;
}
