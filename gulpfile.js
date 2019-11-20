// Include gulp
var gulp = require('gulp');

// Include Our Plugins
var eslint = require('gulp-eslint');
var sass = require('gulp-sass');
var bro = require('gulp-bro');
var stringify = require('stringify');
var babel = require('gulp-babel');
var uglify = require('gulp-uglify-es').default;
var sourcemaps = require('gulp-sourcemaps');
var rename = require('gulp-rename');
var bourbon 	= require('bourbon').includePaths;
var neat		= require('bourbon-neat').includePaths;

var releaseFiles = [
  '**/*',
  '!.nyc_output/**/*',
  '!./{assets,assets/**}',
  '!./{bin,bin/**}',
  '!./{coverage,coverage/**}',
  '!dist/js/{maps,maps/**}',
  '!./{docs,docs/**}',
  '!./{node_modules,node_modules/**}',
  '!./{test,test/**}',
];

var versionBumps = {
  '--patch': 'patch',
  '--minor': 'minor',
  '--major': 'major',
};

// Lint Task
gulp.task('lint', function () {
  return gulp.src('js/*.js')
    .pipe(eslint())
    .pipe(eslint.format())
    .pipe(eslint.failAfterError());
});

// Compile Our Sass
gulp.task('sass', function () {
  return gulp.src('assets/styles/main.scss')
    .pipe(sass({
      includePaths: [bourbon, neat],
    }))
    .pipe(gulp.dest('dist/styles'));
});

// Concatenate & Minify JS
gulp.task('scripts', function (done) {
  gulp.src('assets/js/backbone/app.js')
    .pipe(babel({
      "presets": ['@babel/preset-env']
    }))
    .pipe(bro({ transform: stringify }))
    .pipe(rename('bundle.min.js'))
    .pipe(sourcemaps.init())
    .pipe(uglify())
    .pipe(sourcemaps.write('./maps'))
    .pipe(gulp.dest('dist/js'));
    done();
});

// Move additional resources
gulp.task('move', function (done) {
  gulp.src(['./assets/files/**'])
    .pipe(gulp.dest('dist/files'));
  gulp.src(['./assets/fonts/**'])
    .pipe(gulp.dest('dist/fonts'));
  gulp.src(['./assets/images/**'])
    .pipe(gulp.dest('dist/images'));
  gulp.src(['./assets/img/**'])
    .pipe(gulp.dest('dist/img'));
  gulp.src(['./assets/locales/**'])
    .pipe(gulp.dest('dist/locales'));
  gulp.src(['./assets/*.*'])
    .pipe(gulp.dest('dist'));
  gulp.src(['./assets/js/vendor/fontawesome-all.js'])
    .pipe(gulp.dest('dist/js'));
  done();
});

// Watch Files For Changes
gulp.task('watch', function () {
  gulp.watch('assets/js/backbone/**', gulp.series('lint', 'scripts'));
  gulp.watch('assets/js/utils/**', gulp.series('lint', 'scripts'));
  gulp.watch('assets/styles/**', gulp.series('sass'));
});

// Build task
gulp.task('build', gulp.series('lint', 'sass', 'scripts', 'move'));


//Default task
gulp.task('default', gulp.series('lint', 'sass', 'scripts', 'move', 'watch'));
