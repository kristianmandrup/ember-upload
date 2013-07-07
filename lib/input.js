module.exports = function(U) {
  return U.InputView = Em.View.extend({
    tagName: 'input',
    classNames: 'component upload input'.w(),
    attributeBindings: 'type name'.w(),
    type: 'file',
    to: null,
    didInsertElement: function() {
      var el;

      this._super();
      el = this.$()[0];
      this.set('el', el);
      return el.addEventListener('change', this.onchange.bind(this));
    },
    onchange: function() {
      var el, file, _i, _len, _ref, _results;

      el = this.get('el');
      _ref = el.files;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        file = _ref[_i];
        _results.push(U.Upload.create().upload(file));
      }
      return _results;
    }
  });
};
