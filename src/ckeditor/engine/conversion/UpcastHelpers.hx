package ckeditor.engine.conversion;

import ckeditor.engine.model.Element as ModelElement;
import ckeditor.engine.view.Element as ViewElement;
import ckeditor.engine.view.Matcher.MatcherPattern;

/** A utility class that helps add converters to upcast dispatchers. **/
@:jsRequire("@ckeditor/ckeditor5-engine/src/conversion/upcasthelpers.js", "default")
extern class UpcastHelpers extends ConversionHelpers {

	/** View element to model element conversion helper. **/
	function elementToElement(config: {
		model: EitherType<String, EitherType<ModelElement, (ViewElement, Dynamic) -> ModelElement>>,
		?converterPriority: String,
		?view: MatcherPattern
	}): UpcastHelpers;
}
