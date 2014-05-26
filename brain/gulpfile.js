var gulp = require("gulp"),
    coffee = require('gulp-coffee'),
    gutil = require('gulp-util'),
    concat = require('gulp-concat'),
    mocha = require('gulp-mocha')
    pjson = require('./package.json'),
    clean = require('gulp-clean'),
    tap = require('gulp-tap'),
    objc = tap = require('./obj_translator')
    ;

gulp.task("default", ["clean", "compile-coffee", "copy-npm-dependency"]);

gulp.task("compile-coffee", function() {
  return gulp.src(["app/**/*.coffee", "!app/stubs/*.coffee"])
              .pipe(coffee({bare: true}))
              .pipe(gulp.dest('./brain.bundle/'))
});

gulp.task('watch', function() {
    gulp.watch(['app/**'], ['default']);
});

gulp.task('runspecs', function() {
    return gulp.src(['specs/*.js'], { read: false })
                .pipe(mocha({ reporter: 'list' }))
                .on('error', gutil.log);
});

gulp.task("clean", function(){
  return gulp.src(['./brain.bundle/**'], {read:false})
      .pipe(clean({force: true}));
});

gulp.task("copy-npm-dependency", function(){
  var libs = []
  for (var dep in pjson.dependencies) {
    libs.push("node_modules/" + dep + "/**/*.*");
  };

  return gulp.src(libs, {base: "./node_modules"})
        .pipe(gulp.dest('./brain.bundle/node_modules'))
})

gulp.task("build-api", ["build-h-files", "build-m-files"])

gulp.task("build-m-files", function(){
  return gulp.src("app/public/*.coffee")
              .pipe(coffee({bare: true}))
              .pipe(objc("m"))
              .pipe(gulp.dest('./brain.bundle/'))
});

gulp.task("build-h-files", function(){
  return gulp.src("app/public/*.coffee")
              .pipe(coffee({bare: true}))
              .pipe(objc("h"))
              .pipe(gulp.dest('./brain.bundle/'))
});