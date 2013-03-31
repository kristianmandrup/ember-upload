module.exports = (to)->

  require 'ember'

  U = Em.Namespace.create
    to: to

  require('./upload')(U)
  require('./progress')(U)
  require('./input')(U)
  require('./drop')(U)

  U