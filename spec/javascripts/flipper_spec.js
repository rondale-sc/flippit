describe("Flipper", function(){
  var flipper;
  beforeEach(function(){
    flipper = new App.Flipper($('<div>'));
  });

  describe("retrieveOutput", function(){
    var cb;
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

  describe("shortText", function() {
    it("truncates long strings intelligently (ish).", function(){
      string = "Morbi nec hendrerit ante, nec viverra felis. Aenean et euismod nibh. Praesent sollicitudin urna nulla, quis pellentesque ipsum ultrices gravida Suspendisse";
      truncatedString = "Morbi nec hendrerit ante, nec viverra felis. Aenean et euismod nibh. Praesent sollicitudin urna nulla, quis...";
      expect(flipper.shortText(string)).toEqual(truncatedString);
    });

    it("doesn't truncate strings shorter than 110 chars", function(){
      string = "Not long enough";
      expect(flipper.shortText(string)).toEqual(string);
    });
  });

  describe("updateShareAnchor", function(){
    it("produces a twitter share href", function(){
      spyOn($, 'param').and.callFake(function(params,bool) {
        expect(params['text']).toEqual('"thing"');
        expect(params['url']).toEqual('http://flippit.us');
      });

      flipper.updateShareAnchor("thing");
    });

    it("encodes ¡ǝɯ dı|ɟ into the href if input is empty.",function(){
      spyOn($, 'param').and.callFake(function(params,bool) {
        expect(params['text']).toEqual('"¡ǝɯ dı|ɟ"');
        expect(params['url']).toEqual('http://flippit.us');
      });
      flipper.updateShareAnchor("");
    });
  });
});
