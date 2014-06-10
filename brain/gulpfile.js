var gulp   = require('gulp'          ),
    coffee = require('gulp-coffee'   ),
    util   = require('gulp-util'     ),
    mocha  = require('gulp-mocha'    ),
    pkg    = require('./package.json'),
    clean  = require('gulp-clean'    );

gulp.task("default", ["clean", "copy-js", "compile-coffee", "copy-npm-dependency"]);

gulp.task('copy-js', function() {
 return gulp.src("app/**/*.js")
    .pipe(gulp.dest("./brain.bundle/"));
});

gulp.task("compile-coffee", function() {
  return gulp
          .src(["app/**/*.coffee", "!app/stubs/*.coffee"])
          .pipe(coffee({bare: true}))
          .pipe(gulp.dest('./brain.bundle/'))
});

gulp.task('watch', function() {
    gulp.watch(['app/**'], ['default']);
});

gulp.task('runspecs', function() {
    return gulp
            .src(['specs/*.js'], { read: false })
            .pipe(mocha({ reporter: 'list' }))
            .on('error', util.log);
});

gulp.task("clean", function(){
  return gulp
          .src(['./brain.bundle/**'], {read:false})
          .pipe(clean({force: true}));
});

gulp.task("copy-npm-dependency", function(){
  var libs = []
  for (var dep in pkg.dependencies) {
    libs.push("node_modules/" + dep + "/**/*.*");
  };

  return gulp
          .src(libs, {base: "./node_modules"})
          .pipe(gulp.dest('./brain.bundle/node_modules'))
})
