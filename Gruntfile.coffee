
sysPath = require 'path'

module.exports = (grunt) ->
  grunt.initConfig(
    coffee:
      main:
        expand: true
        src: ['scripts/**/*.coffee']
        dest: 'public/'
        ext: '.js'

    less:
      main:
        expand: true
        src: ['styles/**/*.less']
        dest: 'public/'
        ext: '.css'
        filter: (filepath) ->
          return true if grunt.file.isDir filepath
          not grunt.util._(sysPath.basename filepath).startsWith '_'

    handlebars:
      compile:
        namespace: "JST"
        files:
          "public/scripts/temp.js": "temp/*.hbs"

    concat:
      js:
        options: separator: ';'
        dest: 'public/index.js'
        src: [
          'bower_components/jquery/jquery.js'
          'bower_components/bowser/bowser.js'
          'bower_components/bootstrap/js/transition.js'
          'bower_components/bootstrap/js/modal.js'
          'bower_components/bootstrap/js/carousel.js'
          'bower_components/handlebars/handlebars.js'
          'public/scripts/temp.js'
          'public/scripts/resume.js'
        ]
      css:
        dest: 'public/index.css'
        src: [
          'bower_components/normalize.css/normalize.css'
          'public/styles/resume.css'
        ]

    copy:
      assets:
        expand: true
        cwd: 'assets/'
        src: '**'
        dest: 'public/'

    clean: ['public']

    watch:
      options: livereload: true
      scripts:
        files: 'scripts/**/*.coffee'
        tasks: ['coffee', 'concat']
      styles:
        files: 'styles/**/*.less'
        tasks: ['less', 'concat']
      temp:
        files: 'temp/*.hbs'
        tasks: ['handlebars', 'concat:js']
      assets:
        files: 'assets/**/*'
        tasks: ['copy']

    uglify:
      index:
        options:
          report: "min"
        files:
          'public/index.js': ['public/index.js']

  )
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-handlebars'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-uglify'

  grunt.registerTask 'build', ['clean', 'coffee', 'less', 'handlebars', 'copy', 'concat', 'uglify']
  grunt.registerTask 'default', ['clean', 'coffee', 'less', 'handlebars', 'copy', 'concat', 'watch']

