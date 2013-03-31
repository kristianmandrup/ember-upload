module.exports = (U)->

  compile = Em.Handlebars.compile

  ###
  .bar view
  ###
  barView = Em.View.extend
    attributeBindings: 'style'.w()
    classNames: 'bar'.w()
    init: ->
      @_super()
      U.addObserver 'upload.progress', @onprogress.bind @
    onprogress: ->
      progress = U.get 'upload.progress'
      style = "width: #{progress}%"
      @set 'style', style

  ###
  .bar wrapper
  ###
  U.ProgressView = Em.ContainerView.extend
    childViews: 'barView'.w()
    barView: barView
    classNames: 'component upload progress info'.w()
    classNameBindings: 'show'.w()
    show: false

    init: ->
      @_super()
      U.addObserver 'upload.progress', @onprogress.bind @
      U.addObserver 'upload.abort', @onabort.bind @
      U.addObserver 'upload.error', @onerror.bind @

    onprogress: ->
      progress = U.get 'upload.progress'
      if progress == 100
        @set 'show', false
      else if progress
        @set 'show', true
    onabort: ->
      abort = U.get 'upload.abort'
      if abort
        @set 'show', false
    onerror: ->
      error = U.get 'upload.error'
      if error
        @set 'show', false
