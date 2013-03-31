module.exports = (U)->

  U.InputView = Em.View.extend

    tagName: 'input'
    classNames: 'component upload input'.w()
    attributeBindings: 'type name'.w()
    type: 'file'
    to: null

    didInsertElement: ->

      @_super()

      el = @$()[0]
      @set 'el', el

      el.addEventListener 'change', @onchange.bind @

    onchange: ->
      el = @get 'el'
      for file in el.files
        U.Upload.create().upload(file)