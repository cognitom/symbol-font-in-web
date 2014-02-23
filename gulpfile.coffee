gulp = require 'gulp'
concat = require 'gulp-concat'
spawn = require 'gulp-spawn'
watch = require 'gulp-watch'
replace = require 'gulp-replace'

gulp.task 'markdown', ->
  gulp.src './src/markdown/*.md'
  .pipe concat 'book.md'
  .pipe gulp.dest './int/markdown'

gulp.task 'images', ->
  gulp.src './src/images/**'
  .pipe gulp.dest './int/images'
  
gulp.task 'publish', ->
  gulp.src ['./title.txt', './src/markdown/*.md']
  .pipe concat 'combined.md'
  .pipe replace /\.\.\/images\//g, 'src/images/'
  .pipe spawn
    cmd: "pandoc"
    args: [
      "-o"
      "./build/epub/symbol-font-in-web.epub"
      "--epub-metadata=metadata.xml"
      "--epub-cover-image=cover.jpg"
    ]

gulp.task 'default', ->
  gulp.watch 'src/markdown/*.md', ['markdown']
  gulp.watch 'src/images/**', ['images']