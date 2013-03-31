module.exports = (U)->

  U.DropView = Em.View.extend
    
    classNames: 'component upload drop'.w()
    classNameBindings: 'over'.w()
    over: false

    # dragEnter: (e)->
    # dragOver: (e)->
    # dragLeave: (e)->
    # drop: (e)->

    didInsertElement: ->

      @_super()

      el = @$()[0]
      @set 'el', el

      el.addEventListener 'dragenter', @ondragenter.bind(@), false
      el.addEventListener 'dragover', @ondragover.bind(@), false
      el.addEventListener 'dragleave', @ondragleave.bind(@), false
      el.addEventListener 'drop', @ondrop.bind(@), false

    ondragenter: (e)->
      @set 'over', true
    ondragover: (e)->
      e.preventDefault()
      false
    ondragleave: (e)->
      @set 'over', false
    ondrop: (e)->
      e.stopPropagation()
      e.preventDefault()

      @set 'over', false

      for file in e.dataTransfer.files
        U.Upload.create().upload(file)