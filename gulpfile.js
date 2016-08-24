var gulp = require('gulp');
var browserify = require('browserify');
var riotify = require('riotify');
var source = require('vinyl-source-stream');
var buffer = require('vinyl-buffer');
var browsersync = require("browser-sync");
var uglify = require('gulp-uglify');
var stylus = require('gulp-stylus');
var rename = require('gulp-rename');
var plumber = require('gulp-plumber');
var notify = require('gulp-notify');

var bootstrap = require('bootstrap-styl');

var handleErrors = function() {
  var args = Array.prototype.slice.call(arguments);
  notify.onError({
    title: "Compile Error",
    message: "<%= error %>"
  }).apply(this, args);
  this.emit('end');
}; 

// -----------------------------------------------------------------------
// gae deploy
var exec = require('child_process').exec;

gulp.task('dep',['concat','styl'],function () {
  gulp.src("./dest/index.html").pipe(gulp.dest("./app/template"));
  gulp.src("./dest/bundle.*").pipe(gulp.dest("./app/static"));
  exec('goapp deploy app/app.yaml', function (err, stdout, stderr) {
    console.log(stdout);
    console.log(stderr);
  });
});
// -----------------------------------------------------------------------

gulp.task('server', function () {
  browsersync.init({
    server: {baseDir: 'dest'},
    open: true,
  });
});

gulp.task('concat', function () {
  return browserify({
    debug: false,
    entries: ['./src/index.js']
  })
    .transform(['riotify'])
    .bundle()
    .on('error', handleErrors)
    .pipe(source('bundle.js'))
    // .pipe(buffer())
    // .pipe(uglify({preserveComments: 'some'}))
    .pipe(gulp.dest('./dest/'))
    .pipe(browsersync.stream());
});


gulp.task('styl', function () {
  return gulp.src('./src/index.styl')
    .pipe(plumber({errorHandler: notify.onError('<%= error.message %>')}))
    .pipe(stylus({
      // import:['bootstrap'], //@importが不要になる
      use:[bootstrap()], //これがないと@import bootstrapが超絶エラーになる
      compress: true
    }))
    .pipe(rename('bundle.css'))
    .pipe(gulp.dest('./dest'));
});

gulp.task('develop', ['styl','concat','server'], function() {
  gulp.watch("./dest/*", function() {
    browsersync.reload();
  });
  gulp.watch("./src/**/*.js", ['concat']);
  gulp.watch("./src/**/*.tag", ['concat']);
  gulp.watch("./src/**/*.styl", ['styl']);
});