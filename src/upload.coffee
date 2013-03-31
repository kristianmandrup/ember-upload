module.exports = (U)->

  U.Upload = Em.Object.extend

    init: ->
      @_super()
      U.set 'upload', @

    upload: (file)->

      to = U.get 'to'
      file.slice = file.slice or file.webkitSlice

      body = new FormData
      body.append 'file', file

      req = @req = new XMLHttpRequest

      #req.onloadstart = @onloadstart.bind @
      req.upload.onprogress = @onprogress.bind @
      #req.onload = @onload.bind @
      req.onerror = @onerror.bind @
      req.onabort = @onabort.bind @
      #req.onloadend = @onloadend.bind @

      req.open 'POST', to    
      req.send body

    onloadstart: (e)->
      @set 'loadstart', true
    onprogress: (e)->
      progress = undefined
      if e.lengthComputable
        progress = e.loaded / e.total * 100
      @set 'progress', progress

    onload: (e)->
      @set 'load', true
    onerror: (e)->
      @set 'error', true
    onabort: (e)->
      @set 'abort', true
    onloadend: (e)->
      @set 'loadend', true