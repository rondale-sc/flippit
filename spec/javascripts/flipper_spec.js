describe("Flipper", function(){
  describe("retrieveOutput", function(){
    var flipper,cb;
    beforeEach(function(){
      flipper = new App.Flipper($('<div>'));
    });

    it("posts to /get_flipped", function(){
      var cb = function() {};
      spyOn($, 'ajax').and.callFake(function(url, options){
        expect(url).toEqual("/get_flipped");
      });

      flipper.retrieveOutput(cb);
    });

    it("invokes given callback on success", function(){
      var test = false
      var cb = function() { test = true };

      spyOn($, 'ajax').and.callFake(function(url, options){
        options.success();
      });

      flipper.retrieveOutput(cb);
      expect(test).toBe(true)
    });
  });
});
