// @ts-ignore: no typings available for this package.
import Alignment from '@ckeditor/ckeditor5-alignment/src/alignment';
// @ts-ignore: no typings available for this package.
import Autoformat from '@ckeditor/ckeditor5-autoformat/src/autoformat';
// @ts-ignore: no typings available for this package.
import Bold from '@ckeditor/ckeditor5-basic-styles/src/bold';
// @ts-ignore: no typings available for this package.
import Italic from '@ckeditor/ckeditor5-basic-styles/src/italic';
// @ts-ignore: no typings available for this package.
import Strikethrough from '@ckeditor/ckeditor5-basic-styles/src/strikethrough';
// @ts-ignore: no typings available for this package.
import Underline from '@ckeditor/ckeditor5-basic-styles/src/underline';
// @ts-ignore: no typings available for this package.
import Plugin from '@ckeditor/ckeditor5-core/src/plugin';
// @ts-ignore: no typings available for this package.
import ClassicEditor from '@ckeditor/ckeditor5-editor-classic/src/classiceditor';
// @ts-ignore: no typings available for this package.
import Essentials from '@ckeditor/ckeditor5-essentials/src/essentials';
// @ts-ignore: no typings available for this package.
import Heading from '@ckeditor/ckeditor5-heading/src/heading';
// @ts-ignore: no typings available for this package.
import Image from '@ckeditor/ckeditor5-image/src/image';
// @ts-ignore: no typings available for this package.
import ImageCaption from '@ckeditor/ckeditor5-image/src/imagecaption';
// @ts-ignore: no typings available for this package.
import ImageStyle from '@ckeditor/ckeditor5-image/src/imagestyle';
// @ts-ignore: no typings available for this package.
import ImageToolbar from '@ckeditor/ckeditor5-image/src/imagetoolbar';
// @ts-ignore: no typings available for this package.
import Link from '@ckeditor/ckeditor5-link/src/link';
// @ts-ignore: no typings available for this package.
import List from '@ckeditor/ckeditor5-list/src/list';
// @ts-ignore: no typings available for this package.
import MediaEmbed from '@ckeditor/ckeditor5-media-embed/src/mediaembed';
// @ts-ignore: no typings available for this package.
import MediaEmbedToolbar from '@ckeditor/ckeditor5-media-embed/src/mediaembedtoolbar';
// @ts-ignore: no typings available for this package.
import Paragraph from '@ckeditor/ckeditor5-paragraph/src/paragraph';
// @ts-ignore: no typings available for this package.
import Table from '@ckeditor/ckeditor5-table/src/table';
// @ts-ignore: no typings available for this package.
import TableToolbar from '@ckeditor/ckeditor5-table/src/tabletoolbar';

import {JsonMap} from './map';

/**
 * An implementation of a rich text editor.
 */
export class RichTextEditor extends ClassicEditor {

  /**
   * The set of supported plug-ins.
   */
  static readonly builtinPlugins: Plugin[] = [
    Alignment,
    Autoformat,
    Bold, Italic, Strikethrough, Underline,
    Essentials, // Includes: Clipboard, Enter, ShiftEnter, Typing and Undo.
    Heading,
    Image, ImageCaption, ImageStyle, ImageToolbar,
    Link,
    List,
    MediaEmbed, MediaEmbedToolbar,
    Paragraph,
    Table, TableToolbar
  ];

  /**
   * The default editor settings.
   */
  static readonly defaultConfig: JsonMap = {
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
      'undo', 'redo', '|',
      'bulletedList', 'numberedList', '|',
      'alignment:left', 'alignment:center', 'alignment:right', '|',
      'insertTable', 'mediaEmbed'
    ]
  };
}
