if typeof(window) != 'undefined'
  Guide = window.__xtnd_guide
else
  Guide = global.XtndGuide

class ExampleGuide extends Guide
  htmlVisitor: (location, name, context, url) ->
    value = super(location, name, context, url)
    if name == 'body' && location == 'end'
      return '<script src="'+@INTERNAL_URL_PREFIX+'/inject.js"></script>'
    else
      value

if typeof(window) != 'undefined'
  options = require('data::options')
  guide = new ExampleGuide(options)
  window.xtnd = guide.xtnd
else
  module.exports = ExampleGuide
