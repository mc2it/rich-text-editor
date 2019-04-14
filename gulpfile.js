'use strict';
const {spawn} = require('child_process');
const del = require('del');
const {promises} = require('fs');
const {task, watch} = require('gulp');
const {delimiter, normalize, resolve} = require('path');

// Initialize the build system.
const _path = 'PATH' in process.env ? process.env.PATH : '';
const _vendor = resolve('node_modules/.bin');
if (!_path.includes(_vendor)) process.env.PATH = `${_vendor}${delimiter}${_path}`;

/**
 * The file patterns providing the list of source files.
 * @type {string[]}
 */
const sources = ['*.js', 'src/**/*.ts'];

/**
 * Builds the project.
 */
task('build', async () => {
  await _exec('tsc', ['--project', 'src/tsconfig.json']);
  return _exec('webpack');
});

/**
 * Deletes all generated files and reset any saved state.
 */
task('clean', () => del(['build', 'doc/api', 'lib', 'var/**/*', 'web']));

/**
 * Builds the documentation.
 */
task('doc', async () => {
  for (const path of ['CHANGELOG.md', 'LICENSE.md']) await promises.copyFile(path, `doc/about/${path.toLowerCase()}`);
  await _exec('typedoc', ['--options', 'doc/typedoc.js']);
  await _exec('mkdocs', ['build', '--config-file=doc/mkdocs.yml']);
  return del(['doc/about/changelog.md', 'doc/about/license.md', 'web/mkdocs.yml', 'web/typedoc.js']);
});

/**
 * Fixes the coding standards issues.
 */
task('fix', () => _exec('tslint', ['--fix', ...sources]));

/**
 * Performs the static analysis of source code.
 */
task('lint', () => _exec('tslint', sources));

/**
 * Starts the development server.
 */
task('serve', () => _exec('http-server', ['example', '-o']));

/**
 * Upgrades the project to the latest revision.
 */
task('upgrade', async () => {
  await _exec('git', ['reset', '--hard']);
  await _exec('git', ['fetch', '--all', '--prune']);
  await _exec('git', ['pull', '--rebase']);
  await _exec('npm', ['install', '--ignore-scripts']);
  return _exec('npm', ['update', '--dev']);
});

/**
 * Watches for file changes.
 */
task('watch', () => watch('src/**/*.ts', {ignoreInitial: false}, task('build')));

/**
 * Runs the default tasks.
 */
task('default', task('build'));

/**
 * Spawns a new process using the specified command.
 * @param {string} command The command to run.
 * @param {string[]} [args] The command arguments.
 * @param {Partial<SpawnOptions>} [options] The settings to customize how the process is spawned.
 * @return {Promise<void>} Completes when the command is finally terminated.
 */
function _exec(command, args = [], options = {}) {
  return new Promise((fulfill, reject) => spawn(normalize(command), args, Object.assign({shell: true, stdio: 'inherit'}, options))
    .on('close', code => code ? reject(new Error(`${command}: ${code}`)) : fulfill())
  );
}
