package mc2it_rte.timestamp;

import js.lib.Date;
import js.npm.ckeditor.core.Command;
import js.npm.ckeditor.engine.model.Element;

/** Inserts the current date and time. **/
@:keep class TimestampCommand extends Command {

	/** Executes this command. **/
	public function execute(?arguments: {value: Float}) {
		final model = editor.model;
		final timestamp = arguments != null ? arguments.value : Date.now();
		model.change(writer -> model.insertContent(writer.createElement("timestamp", {value: timestamp})));
	}

	/** Refreshes this command. **/
	override public function refresh() {
		final model = editor.model;
		isEnabled = model.schema.checkChild((model.document.selection.focus.parent: Element), "timestamp");
	}
}
