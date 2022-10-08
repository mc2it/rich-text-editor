import {RichTextEditor} from "@mc2it/rte";

/**
 * Creates a text area and attaches a rich text editor to it.
 * @returns {Promise.<void>} Completes when the editor has been attached.
 */
async function main() {
	try {
		const textArea = document.createElement("textarea");
		document.body.appendChild(textArea);

		const options = {language: "en", placeholder: "Type the content here!"};
		await RichTextEditor.create(textArea, options);
	}
	catch (error) {
		console.error(error);
	}
}
