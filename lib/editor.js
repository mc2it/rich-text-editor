import Alignment from '@ckeditor/ckeditor5-alignment/src/alignment.js';
import Autoformat from '@ckeditor/ckeditor5-autoformat/src/autoformat.js';
import Bold from '@ckeditor/ckeditor5-basic-styles/src/bold.js';
import Italic from '@ckeditor/ckeditor5-basic-styles/src/italic.js';
import Strikethrough from '@ckeditor/ckeditor5-basic-styles/src/strikethrough.js';
import Underline from '@ckeditor/ckeditor5-basic-styles/src/underline.js';
import Plugin from '@ckeditor/ckeditor5-core/src/plugin.js';
import ClassicEditor from '@ckeditor/ckeditor5-editor-classic/src/classiceditor.js';
import Essentials from '@ckeditor/ckeditor5-essentials/src/essentials.js';
import FontBackgroundColor from '@ckeditor/ckeditor5-font/src/fontbackgroundcolor.js';
import FontColor from '@ckeditor/ckeditor5-font/src/fontcolor.js';
import Heading from '@ckeditor/ckeditor5-heading/src/heading.js';
import Image from '@ckeditor/ckeditor5-image/src/image.js';
import ImageCaption from '@ckeditor/ckeditor5-image/src/imagecaption.js';
import ImageStyle from '@ckeditor/ckeditor5-image/src/imagestyle.js';
import ImageToolbar from '@ckeditor/ckeditor5-image/src/imagetoolbar.js';
import Link from '@ckeditor/ckeditor5-link/src/link.js';
import List from '@ckeditor/ckeditor5-list/src/list.js';
import MediaEmbed from '@ckeditor/ckeditor5-media-embed/src/mediaembed.js';
import MediaEmbedToolbar from '@ckeditor/ckeditor5-media-embed/src/mediaembedtoolbar.js';
import Paragraph from '@ckeditor/ckeditor5-paragraph/src/paragraph.js';
import PasteFromOffice from '@ckeditor/ckeditor5-paste-from-office/src/pastefromoffice.js';
import Table from '@ckeditor/ckeditor5-table/src/table.js';
import TableToolbar from '@ckeditor/ckeditor5-table/src/tabletoolbar.js';

/** An implementation of a rich text editor. */
export class RichTextEditor extends ClassicEditor {

  /**
   * The set of supported plug-ins.
   * @type {Plugin[]}
   */
  static get builtinPlugins() {
    return [
      Alignment,
      Autoformat,
      Bold, Italic, Strikethrough, Underline,
      Essentials, // Includes: Clipboard, Enter, ShiftEnter, Typing and Undo.
      FontBackgroundColor, FontColor,
      Heading,
      Image, ImageCaption, ImageStyle, ImageToolbar,
      Link,
      List,
      MediaEmbed, MediaEmbedToolbar,
      Paragraph,
      PasteFromOffice,
      Table, TableToolbar
    ];
  }

  /**
   * The default editor settings.
   * @type {object}
   */
  static get defaultConfig() {
    return {
      alignment: {
        options: ['left', 'center', 'right']
      },
      image: {
        styles: ['full', 'alignLeft', 'alignCenter', 'alignRight'],
        toolbar: ['imageStyle:full', 'imageStyle:alignLeft', 'imageStyle:alignCenter', 'imageStyle:alignRight']
      },
      language: 'fr',
      table: {
        contentToolbar: ['tableColumn', 'tableRow', 'mergeTableCells']
      },
      toolbar: [
        'heading', '|',
        'bold', 'italic', 'underline', 'strikethrough', 'link', '|',
        'fontColor', 'fontBackgroundColor', '|',
        'undo', 'redo', '|',
        'bulletedList', 'numberedList', '|',
        'alignment:left', 'alignment:center', 'alignment:right', '|',
        'insertTable', 'mediaEmbed'
      ]
    };
  }
}
