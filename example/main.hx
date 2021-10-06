import js.Browser.*;
import mc2it_rte.RichTextEditor;

/** Creates a text area and attaches a rich text editor to it. **/
function main() {
	final textArea = document.createTextAreaElement();
	document.body.appendChild(textArea);

	RichTextEditor
		.create(textArea, {language: "en", placeholder: "Type the content here!"})
		.catchError(console.error);
}
