'use strict';

module.exports = function(grunt) {
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        jshint: {
            files: ['Gruntfile.js', 'src/**/*.js', 'test/**/*.js'],
            options: {
                esversion: 6,
                globalstrict: true,
                globals: {
                    module: true,
                    console: true,
                    require: true,
                    process: true,
                    it: true,
                    describe: true,
                    before: true,
                    beforeEach: true,
                    afterEach: true
                }
            }
        },
        jsbeautifier: {
            files : ['src/**/*.js', 'test/**/*.js'],
            options : {
                js: {
                    braceStyle: "collapse",
                    breakChainedMethods: false,
                    e4x: false,
                    evalCode: false,
                    indentChar: " ",
                    indentLevel: 0,
                    indentSize: 4,
                    indentWithTabs: false,
                    jslintHappy: false,
                    keepArrayIndentation: false,
                    keepFunctionIndentation: false,
                    maxPreserveNewlines: 10,
                    preserveNewlines: true,
                    spaceBeforeConditional: true,
                    spaceInParen: false,
                    unescapeStrings: false,
                    wrapLineLength: 0,
                    endWithNewline: true
                }
            }
        },
        mochaTest: {
            test: {
              options: {
                reporter: 'spec',
                captureFile: 'results.txt',
                quiet: false,
                clearRequireCache: false,
                clearCacheFilter: (key) => true,
                noFail: false
              },
              src: ['test/**/*.js']
            }
          }
    });

    grunt.loadNpmTasks('grunt-mocha-test');
    grunt.loadNpmTasks('grunt-jsbeautifier');
    grunt.loadNpmTasks('grunt-contrib-jshint');

    grunt.registerTask('default', ['jsbeautifier', 'jshint', 'mochaTest']);
};