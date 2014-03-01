var App = App || {};

(function(namespace){
  Flipper = function($el){
    this.$el = $el
    this.addListeners();
  }

  Flipper.prototype.retrieveOutput = function (cb) {
    var data = { string: this.$el.find('input').val() };

    $.ajax("/get_flipped", {
      method: "POST",
      data: data,
      success: $.proxy(cb, this)
    });
  }

  Flipper.prototype.updateInputValue = function(response){
    this.$el.find('input').val(response.output).select();
  }

  Flipper.prototype.addListeners = function() {
    var that = this;

    $('body').on('submit', function(e) {
      e.preventDefault();
      $.proxy(that.retrieveOutput(that.updateInputValue), that);
    })

    this.$el.find('a').on('click',function(e) {
      e.preventDefault();
      that.$el.find('form').submit();
    })
  }

  namespace.Flipper = Flipper;
}(App));
