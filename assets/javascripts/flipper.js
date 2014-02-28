var App = App || {};

(function(namespace){
  Flipper = function(){
    this.addListeners();
  }

  function retrieveOutput() {
    var data = { string: $('.flip_it input').val() }

    $.ajax("/get_flipped", {
      method: "POST",
      data: data,
      success: function(response){
	$('.flip_it input').val(response.output).select();
      }
    });
  }

  Flipper.prototype.addListeners = function() {
    $('body').on('click', '.flip_it a', function(e){ retrieveOutput() });
    $('body').on('keyup', '.flip_it input', function(e){ if(e.which == 13){ retrieveOutput() } });
  }

  namespace.Flipper = Flipper;
}(App));

$(function(){
  new App.Flipper();
  $('input').focus();
});
