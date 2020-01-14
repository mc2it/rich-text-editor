const {spawn} = require('child_process');
const del = require('del');
const {promises} = require('fs');
const {dest, series, src, task, watch} = require('gulp');
const replace = require('gulp-replace');
const {delimiter, normalize, resolve} = require('path');

/**
 * The file patterns providing the list of source files.
 * @type {string[]}
 */
const sources = ['src/**/*.ts'];

// Initialize the build system.
const _path = 'PATH' in process.env ? process.env.PATH : '';
const _vendor = resolve('node_modules/.bin');
if (!_path.includes(_vendor)) process.env.PATH = `${_vendor}${delimiter}${_path}`;

/** Builds the project. */
task('build:fix', () => src('lib/**/*.js')
  .pipe(replace(/(export|import)\s+(.+)\s+from\s+'(\.[^']+)'/g, "$1 $2 from '$3.js'"))
  .pipe(replace(/(export|import)\s+(.+)\s+from\s+'(@ckeditor\/[^']+)'/g, "$1 $2 from '$3.js'"))
  .pipe(dest('lib')));

task('build:dist', () => _exec('webpack', ['--config=etc/webpack.cjs']));
task('build:js', () => _exec('tsc', ['--project', 'src/tsconfig.json']));
task('build', series('build:js', 'build:fix', 'build:dist'));

/** Deletes all generated files and reset any saved state. */
task('clean', () => del(['build', 'doc/api', 'lib', 'var/**/*', 'web']));

/** Builds the documentation. */
task('doc', async () => {
  for (const path of ['CHANGELOG.md', 'LICENSE.md']) await promises.copyFile(path, `doc/about/${path.toLowerCase()}`);
  await _exec('typedoc', ['--gaID', process.env.GOOGLE_ANALYTICS_ID, '--options', 'etc/typedoc.json']);
  await _exec('mkdocs', ['build', '--config-file=doc/mkdocs.yaml']);
  return del(['doc/about/changelog.md', 'doc/about/license.md', 'web/mkdocs.yaml']);
});

/** Fixes the coding standards issues. */
task('fix', () => _exec('eslint', ['--config=etc/eslint.yaml', '--fix', ...sources]));

/** Performs the static analysis of source code. */
task('lint', () => _exec('eslint', ['--config=etc/eslint.yaml', ...sources]));

/** Upgrades the project to the latest revision. */
task('upgrade', async () => {
  await _exec('git', ['reset', '--hard']);
  await _exec('git', ['fetch', '--all', '--prune']);
  await _exec('git', ['pull', '--rebase']);
  await _exec('npm', ['install', '--ignore-scripts', '--production=false']);
  return _exec('npm', ['update', '--dev']);
});

/** Watches for file changes. */
task('watch', () => watch('src/**/*.ts', {ignoreInitial: false}, task('build')));

/** Runs the default tasks. */
task('default', task('build'));

/**
 * Spawns a new process using the specified command.
 * @param {string} command The command to run.
 * @param {string[]} args The command arguments.
 * @param {object} options The settings to customize how the process is spawned.
 * @return {Promise<void>} Completes when the command is finally terminated.
 */
function _exec(command, args = [], options = {}) {
  return new Promise((fulfill, reject) => spawn(normalize(command), args, {shell: true, stdio: 'inherit', ...options})
    .on('close', code => code ? reject(new Error(`${command}: ${code}`)) : fulfill())
  );
}
