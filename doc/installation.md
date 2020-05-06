# Installation

## Requirements
Before installing **SAB Rich Text Editor**, you need to make sure you have [Node.js](https://nodejs.org)
and [npm](https://www.npmjs.com), the Node.js package manager, up and running.

!!! warning
    SAB Rich Text Editor requires Node.js >= **14.0.0**.

You can verify if you're already good to go with the following commands:

```shell
node --version
# v14.2.0

npm --version
# 6.14.4
```

!!! info
    If you plan to play with the package sources, you will also need [Gulp](https://gulpjs.com) and [Material for MkDocs](https://squidfunk.github.io/mkdocs-material).

## Installing with npm package manager

### 1. Install it
From a command prompt, run:

```shell
npm install @sab-international/rich-text-editor
```

### 2. Import it
Now in your [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript) or [TypeScript](https://www.typescriptlang.org) code, you can use:

```js
import {RichTextEditor} from '@sab-international/rich-text-editor';
```

## Installing from a content delivery network
This library is also available as a ready-made bundle.
To install it, add this code snippet to the `<head>` of your HTML document:

```html
<!-- jsDelivr -->
<script src="https://cdn.jsdelivr.net/npm/@sab-international/rich-text-editor/build/editor.js"></script>

<!-- UNPKG -->
<script src="https://unpkg.com/@sab-international/rich-text-editor/build/editor.js"></script>

<!-- SAB International -->
<script src="https://static.sabcomputer.com/js/rich-text-editor/latest/editor.js"></script>
```
