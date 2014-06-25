/**
  * Module dependencies.
  */
require('ember');

/**
  * Expose.
  */
module.exports = function() {
  var U = Em.Namespace.create();
  require('./progress')(U);
  require('./drop')(U);
  return U;
};
