gulp = require 'gulp'
concat = require 'gulp-concat'
spawn = require 'gulp-spawn'
watch = require 'gulp-watch'

gulp.task 'markdown', ->
  gulp.src './src/markdown/*.md'
  .pipe concat 'book.md'
  .pipe gulp.dest './int/markdown'

gulp.task 'images', ->
  gulp.src './src/images/**'
  .pipe gulp.dest './int/images'
  
gulp.task 'publish', ->
  gulp.src './int/markdown/book.md'
  .pipe spawn
    cmd: "pandoc"
    args: [
      "-o"
      "./build/epub/book.epub"
    ]

gulp.task 'default', ->
  gulp.watch 'src/markdown/*.md', ['markdown']
  gulp.watch 'src/images/**', ['images']