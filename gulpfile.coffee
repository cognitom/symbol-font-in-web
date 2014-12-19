gulp = require 'gulp'
concat = require 'gulp-concat'
spawn = require 'gulp-spawn'
watch = require 'gulp-watch'
replace = require 'gulp-replace'
wrap = require 'gulp-wrap'

gulp.task 'markdown', ->
  gulp.src './src/markdown/*.md'
  .pipe concat 'book.md'
  .pipe gulp.dest './int/markdown'

# TODO: Resize images
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
      "--epub-stylesheet=./src/css/epub.css"
    ]
###
gulp.task 'publish', ->
  gulp.src ['./title.txt', './src/markdown/*.md']
  .pipe concat 'symbol-font-in-web.md'
  .pipe replace /\.\.\/images\//g, 'src/images/'
  .pipe spawn
    cmd: "pandoc"
    args: [
      "-f", "markdown"
      "-t", "epub"
      "--epub-metadata=metadata.xml"
      "--epub-cover-image=cover.jpg"
      "--epub-stylesheet=./src/css/epub.css"
    ]
    filename: (base, ext) -> base + '.epub'
  .pipe gulp.dest './build/epub'
###

gulp.task 'default', ->
  gulp.watch 'src/markdown/*.md', ['markdown']
  gulp.watch 'src/images/**', ['images']