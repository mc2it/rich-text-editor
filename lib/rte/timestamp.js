// @ts-nocheck
import {Command, Plugin} from "@ckeditor/ckeditor5-core";
import {ButtonView} from "@ckeditor/ckeditor5-ui";
import {add as addTranslation} from "@ckeditor/ckeditor5-utils/src/translation-service.js";
import {Widget, toWidget, viewToModelPositionOutsideModelElement} from "@ckeditor/ckeditor5-widget";

/**
 * Inserts the current date and time.
 */
class TimestampCommand extends Command {

	/**
	 * Executes this command.
	 * @param {Object} [args] The command arguments.
	 * @param {number} args.value The timestamp value, in milliseconds.
	 */
	execute(args) {
		const {model} = this.editor;
		model.change(writer => model.insertContent(writer.createElement("timestamp", {value: args?.value ?? Date.now()})));
	}

	/**
	 * Refreshes this command.
	 */
	refresh() {
		const {model} = this.editor;
		this.isEnabled = model.schema.checkChild(model.document.selection.focus.parent, "timestamp");
	}
}

/**
 * The editing layer of the timestamp plugin.
 */
class TimestampEditing extends Plugin {

	/**
	 * Declares the plugin dependencies.
	 * @type {Array.<Plugin.constructor>}
	 * @readonly
	 */
	static requires = [Widget];

	/**
	 * Initializes this plugin.
	 * @returns {(void|Promise.<void>)} Resolves when the plugin is intialized.
	 */
	init() {
		this.#defineConverters();
		this.#defineSchema();

		const viewToModelPosition = viewToModelPositionOutsideModelElement(this.editor.model, viewElement => viewElement.hasClass("timestamp"));
		this.editor.commands.add("timestamp", new TimestampCommand(this.editor));
		this.editor.editing.mapper.on("viewToModelPosition", viewToModelPosition);
	}

	/**
	 * Helper method for the downcast converters.
	 * @param {module:"@ckeditor/ckeditor5-engine".Element} modelItem The model item.
	 * @param {module:"@ckeditor/ckeditor5-engine".DowncastWriter} viewWriter The view writer.
	 */
	#createTimestampView(modelItem, viewWriter) {
		const dateFormatter = new Intl.DateTimeFormat(this.editor.locale.contentLanguage, {dateStyle: "long", timeStyle: "short"});
		const timestamp = modelItem.hasAttribute("value") ? modelItem.getAttribute("value") : Date.now();
		const timestampView = viewWriter.createContainerElement("span", {class: "timestamp", "data-value": timestamp});
		const innerText = viewWriter.createText(dateFormatter.format(new Date(timestamp)));
		viewWriter.insert(viewWriter.createPositionAt(timestampView, 0), innerText);
		return timestampView;
	}

	/**
	 * Defines the plugin converters.
	 */
	#defineConverters() {
		this.editor.conversion.for("dataDowncast").elementToElement({
			model: "timestamp",
			view: (modelItem, conversionApi) => this.#createTimestampView(modelItem, conversionApi.writer)
		});

		this.editor.conversion.for("editingDowncast").elementToElement({
			model: "timestamp",
			view: (modelItem, conversionApi) => toWidget(this.#createTimestampView(modelItem, conversionApi.writer), conversionApi.writer)
		});

		this.editor.conversion.for("upcast").elementToElement({
			model: (viewElement, conversionApi) => {
				const timestamp = viewElement.hasAttribute("data-value") ? Number.parseInt(viewElement.getAttribute("data-value"), 10) : Date.now();
				conversionApi.writer.createElement("timestamp", {value: timestamp});
			},
			view: {classes: "timestamp", name: "span"}
		});
	}

	/**
	 * Defines the plugin schema.
	 */
	#defineSchema() {
		this.editor.model.schema.register("timestamp", {
			allowAttributes: ["value"],
			allowWhere: "$text",
			isInline: true,
			isObject: true
		});
	}
}

/**
 * The user interface layer of the timestamp plugin.
 */
class TimestampUI extends Plugin {

	/**
	 * Initializes this plugin.
	 * @returns {(void|Promise.<void>)} Resolves when the plugin is intialized.
	 */
	init() {
		addTranslation("es", {Timestamp: "Marca de tiempo"});
		addTranslation("fr", {Timestamp: "Horodatage"});

		this.editor.ui.componentFactory.add("timestamp", locale => {
			const buttonView = new ButtonView(locale);
			buttonView.bind("isEnabled").to(this.editor.commands.get("timestamp"));
			buttonView.set({
				icon: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"><path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z"/><path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0z"/></svg>', // eslint-disable-line max-len
				label: this.editor.t("Timestamp"),
				tooltip: true
			});

			this.listenTo(buttonView, "execute", () => {
				this.editor.execute("timestamp");
				this.editor.focus();
			});

			return buttonView;
		});
	}
}

/**
 * Inserts the current date and time.
 */
export class Timestamp extends Plugin {

	/**
	 * The plugin name.
	 * @type {string}
	 * @readonly
	 */
	static pluginName = "Timestamp";

	/**
	 * Declares the plugin dependencies.
	 * @type {Array.<Plugin.constructor>}
	 * @readonly
	 */
	static requires = [TimestampEditing, TimestampUI];
}
