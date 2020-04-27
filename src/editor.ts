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
import HorizontalLine from '@ckeditor/ckeditor5-horizontal-line/src/horizontalline.js';
import Image from '@ckeditor/ckeditor5-image/src/image.js';
import ImageCaption from '@ckeditor/ckeditor5-image/src/imagecaption.js';
import ImageResize from '@ckeditor/ckeditor5-image/src/imageresize.js';
import ImageStyle from '@ckeditor/ckeditor5-image/src/imagestyle.js';
import ImageToolbar from '@ckeditor/ckeditor5-image/src/imagetoolbar.js';
import Link from '@ckeditor/ckeditor5-link/src/link.js';
import List from '@ckeditor/ckeditor5-list/src/list.js';
import TodoList from '@ckeditor/ckeditor5-list/src/todolist.js';
import MediaEmbed from '@ckeditor/ckeditor5-media-embed/src/mediaembed.js';
import MediaEmbedToolbar from '@ckeditor/ckeditor5-media-embed/src/mediaembedtoolbar.js';
import Paragraph from '@ckeditor/ckeditor5-paragraph/src/paragraph.js';
import PasteFromOffice from '@ckeditor/ckeditor5-paste-from-office/src/pastefromoffice.js';
import RemoveFormat from '@ckeditor/ckeditor5-remove-format/src/removeformat.js';
import RemoveFormatLinks from '@ckeditor/ckeditor5-remove-format/src/removeformatui.js';
import Table from '@ckeditor/ckeditor5-table/src/table.js';
import TableCellProperties from '@ckeditor/ckeditor5-table/src/tablecellproperties.js';
import TableProperties from '@ckeditor/ckeditor5-table/src/tableproperties.js';
import TableToolbar from '@ckeditor/ckeditor5-table/src/tabletoolbar.js';
import TextTransformation from '@ckeditor/ckeditor5-typing/src/texttransformation.js';

/** An implementation of a rich text editor. */
export class RichTextEditor extends ClassicEditor {

  /** The set of supported plug-ins. */
  static readonly builtinPlugins: Plugin[] = [
    Alignment,
    Autoformat,
    Bold, Italic, Strikethrough, Underline,
    Essentials,
    FontBackgroundColor, FontColor,
    Heading,
    HorizontalLine,
    Image, ImageCaption, ImageResize, ImageStyle, ImageToolbar,
    Link,
    List, TodoList,
    MediaEmbed, MediaEmbedToolbar,
    Paragraph,
    PasteFromOffice,
    RemoveFormat, RemoveFormatLinks,
    Table, TableCellProperties, TableProperties, TableToolbar,
    TextTransformation
  ];

  /** The default editor settings. */
  static readonly defaultConfig: Record<string, any> = {
    alignment: {
      options: ['left', 'center', 'right']
    },
    image: {
      resizeUnit: 'px',
      styles: ['full', 'alignLeft', 'alignCenter', 'alignRight'],
      toolbar: ['imageStyle:full', 'imageStyle:alignLeft', 'imageStyle:alignCenter', 'imageStyle:alignRight']
    },
    language: 'fr',
    table: {
      contentToolbar: [
        'tableColumn', 'tableRow', 'mergeTableCells',
        'tableProperties', 'tableCellProperties'
      ]
    },
    toolbar: [
      'heading', '|',
      'bold', 'italic', 'underline', 'strikethrough', 'link', '|',
      'fontColor', 'fontBackgroundColor', '|',
      'removeFormat', '|',
      'undo', 'redo', '|',
      'bulletedList', 'numberedList', 'todoList', '|',
      'alignment:left', 'alignment:center', 'alignment:right', '|',
      'horizontalLine', 'insertTable', 'mediaEmbed'
    ],
    typing: {
      transformations: {
        remove: ['quotes']
      }
    }
  };
}
