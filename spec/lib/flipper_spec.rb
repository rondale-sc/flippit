require 'rspec'
require_relative '../../lib/flipper'

describe Flipper do
  subject(:flipper) do
    Class.new do
      include Flipper
    end.new
  end

  describe ".flip_it" do
    it "flips lower case letters" do
      expect(flipper.flip_it("abcdefghijklmnopqrstuvwxyz")).to eq("zʎxʍʌnʇsɹbdouɯ|ʞɾıɥƃɟǝpɔqɐ")
    end

    it "flips upper case letters" do
      expect(flipper.flip_it("ABCDEFGHIJKLMNOPQRSTUVWXYZ")).to eq("zʎxʍʌnʇsɹbdouɯ|ʞɾıɥƃɟǝpɔqɐ")
    end

    it "flips numbers" do
      expect(flipper.flip_it("1234567890")).to eq("068ㄥ9ϛㄣƐᄅƖ")
    end

    it "flips puctuation" do
      expect(flipper.flip_it("[],'){}?!\<>;")).to eq("؛<>¡¿{}(\"'[]")
    end

    it "flips and reverses" do
      expect(flipper.flip_it("Jonathan Jackson")).to eq("uosʞɔɐɾ uɐɥʇɐuoɾ")
    end

    it "converts both ways" do
      expect(flipper.flip_it("uosʞɔɐɾ uɐɥʇɐuoɾ")).to eq("jonathan jackson")
    end

    it "prints random smiley when confronted with unknown character" do
      stub_const('WahWah', [":)", "^_^"])

      result = flipper.flip_it('`')
      expect(WahWah).to include(result)
    end
  end
end
