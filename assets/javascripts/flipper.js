var App = App || {};

(function(namespace){
  Flipper = function($el){
    this.$el = $el
    this.addListeners();
  }

  Flipper.prototype.updateShareAnchor = function(input) {
    if(!input.length) { input = "¡ǝɯ dı|ɟ" } else { input = input }

    var params = {
      text: '"' + this.shortText(input) + '"',
      url: "http://flippit.us"
    }

    return "http://twitter.com/share?" + $.param(params,true)
  }

  Flipper.prototype.retrieveOutput = function (cb) {
    var data = { string: this.$el.find('input').val() };

    $.ajax("/get_flipped", {
      method: "POST",
      data: data,
      success: $.proxy(cb, this)
    });
  }

  Flipper.prototype.shortText = function(string) {
    if(string.length > 110) {
      var shortText = $.trim(string)
        .substring(0, 110)
        .split(" ")
        .slice(0, -1)
        .join(" ") + "...";
    } else {
      var shortText = string
    }
    return shortText;
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

    this.$el.find('a.flipper').on('click',function(e) {
      e.preventDefault();
      that.$el.find('form').submit();
    })

    this.$el.find('a.share').on('click', function(e) {
      var input = that.$el.find('input').val()
      $(this).attr('href', that.updateShareAnchor(input))
    })
  }

  namespace.Flipper = Flipper;
}(App));
