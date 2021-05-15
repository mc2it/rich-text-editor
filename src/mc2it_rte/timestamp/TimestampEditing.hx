package mc2it_rte.timestamp;

import js.lib.Date;
import js.lib.intl.DateTimeFormat;
import js.ckeditor.core.Plugin;
import js.ckeditor.engine.conversion.DowncastHelpers;
import js.ckeditor.engine.conversion.UpcastHelpers;
import js.ckeditor.engine.model.Element as ModelElement;
import js.ckeditor.engine.view.DowncastWriter;
import js.ckeditor.engine.view.Element as ViewElement;
import js.ckeditor.widget.Utils;
import js.ckeditor.widget.Widget;

/** The editing layer of the timestamp plugin. **/
@:keep class TimestampEditing extends Plugin {

	/** Declares the plugin dependencies. **/
	public static final requires: Array<Class<Plugin>> = [
		Widget
	];

	/** Initializes this plugin. **/
	public function init() {
		defineConverters();
		defineSchema();
		editor.commands.add("timestamp", new TimestampCommand(editor));
		editor.editing.mapper.on("viewToModelPosition", Utils.viewToModelPositionOutsideModelElement(editor.model, viewElement -> viewElement.hasClass("timestamp")));
	}

	/** Helper method for the downcast converters. **/
	function createTimestampView(modelItem: ModelElement, viewWriter: DowncastWriter) {
		final dateFormat = new DateTimeFormat(editor.locale.contentLanguage, {
			day: Numeric,
			hour: Numeric,
			minute: Numeric,
			month: Long,
			year: Numeric,
		});

		final timestamp = modelItem.hasAttribute("value") ? modelItem.getAttribute("value") : Date.now();
		final timestampView = viewWriter.createContainerElement("span", {"class": "timestamp", "data-value": timestamp});
		final innerText = viewWriter.createText(dateFormat.format(new Date(timestamp)));
		viewWriter.insert(viewWriter.createPositionAt(timestampView, 0), innerText);
		return timestampView;
	}

	/** Defines the plugin converters. **/
	function defineConverters() {
		final dataDowncast: DowncastHelpers = editor.conversion.forGroup("dataDowncast");
		dataDowncast.elementToElement({
			model: "timestamp",
			view: (modelItem: ModelElement, conversionApi) -> createTimestampView(modelItem, conversionApi.writer)
		});

		final editingDowncast: DowncastHelpers = editor.conversion.forGroup("editingDowncast");
		editingDowncast.elementToElement({
			model: "timestamp",
			view: (modelItem: ModelElement, conversionApi) -> Utils.toWidget(createTimestampView(modelItem, conversionApi.writer), conversionApi.writer)
		});

		final upcast: UpcastHelpers = editor.conversion.forGroup("upcast");
		upcast.elementToElement({
			model: (viewElement: ViewElement, conversionApi) -> {
				final timestamp = viewElement.hasAttribute("data-value") ? Std.parseFloat(viewElement.getAttribute("data-value")) : Date.now();
				conversionApi.writer.createElement("timestamp", {value: timestamp});
			},
			view: {classes: "timestamp", name: "span"}
		});
	}

	/** Defines the plugin schema. **/
	function defineSchema() editor.model.schema.register("timestamp", {
		allowAttributes: ["value"],
		allowWhere: "$text",
		isInline: true,
		isObject: true
	});
}
