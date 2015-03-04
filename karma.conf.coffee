# Karma configuration
# Generated on Sat Feb 28 2015 23:58:39 GMT+0100 (CET)

module.exports = (config) ->

  if not process.env.SAUCE_USERNAME or not process.env.SAUCE_ACCESS_KEY
    console.error 'Make sure the SAUCE_USERNAME and SAUCE_ACCESS_KEY environment variables are set.'
    process.exit 1

  customLaunchers =
    'SL_Chrome':
      base: 'SauceLabs'
      browserName: 'chrome'
    'SL_Firefox':
      base: 'SauceLabs'
      browserName: 'firefox'

  config.set

    # base path that will be used to resolve all patterns (eg. files, exclude)
    basePath: ''


    # frameworks to use
    # available frameworks: https://npmjs.org/browse/keyword/karma-adapter
    frameworks: ['mocha', 'chai']

    plugins: [
      'karma-mocha'
      'karma-chai'
      'karma-coffee-preprocessor'
      'karma-sauce-launcher'
      'karma-mocha-reporter'
    ]

    client:
      mocha:
        reporter: 'html'
        ui: 'bdd'

    # list of files / patterns to load in the browser
    files: [
      'src/*.js',
      'test/*.coffee'
    ]


    # list of files to exclude
    exclude: [
    ]


    # preprocess matching files before serving them to the browser
    # available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor
    preprocessors: {
      '**/*.coffee': ['coffee']
    }


    # test results reporter to use
    # possible values: 'dots', 'progress'
    # available reporters: https://npmjs.org/browse/keyword/karma-reporter
    reporters: ['progress', 'mocha', 'saucelabs']


    # web server port
    port: 9876


    # enable / disable colors in the output (reporters and logs)
    colors: true


    # level of logging
    # possible values:
    # - config.LOG_DISABLE
    # - config.LOG_ERROR
    # - config.LOG_WARN
    # - config.LOG_INFO
    # - config.LOG_DEBUG
    logLevel: config.LOG_INFO


    # enable / disable watching file and executing tests whenever any file changes
    autoWatch: false

    # Continuous Integration mode
    # if true, Karma captures browsers, runs the tests and exits
    singleRun: true

    # sauce labs config
    sauceLabs:
      testName: 'Karma and Sauce Labs demo'
      startConnect: !process.env.TRAVIS

    customLaunchers: customLaunchers

    browsers: Object.keys(customLaunchers)
