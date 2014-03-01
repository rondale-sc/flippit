describe("Integration", function(){
  var flipper;

  beforeEach(function(){
    loadFixtures('main.html')
    flipper = new App.Flipper($('.flip_it'));
  });

  it("works!" ,function(done){
    spyOn(Flipper.prototype, 'updateInputValue').and.callFake(function(response){
      expect(response.output).toEqual("Bar");
      done();
    });

    spyOn($, 'ajax').and.callFake(function(url, options){
      options.success({output: "Bar"})
    });

    $('.flip_it input').val('Foo');
    $('.flip_it a').trigger('click');
  });
});
