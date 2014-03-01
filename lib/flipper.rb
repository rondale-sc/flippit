module Flipper
  class CharNotAvailableError < StandardError; end

  Fliptable = {
    "a"        => "\u{0250}",
    "b"        => "q",
    "c"        => "\u{0254}",
    "d"        => "p",
    "e"        => "\u{01DD}",
    "f"        => "\u{025F}",
    "g"        => "\u{0183}",
    "h"        => "\u{0265}",
    "i"        => "\u{0131}",
    "j"        => "\u{027E}",
    "k"        => "\u{029E}",
    "l"        => "|",
    "m"        => "\u{026F}",
    "n"        => "u",
    "o"        => "o",
    "p"        => "d",
    "q"        => "b",
    "r"        => "\u{0279}",
    "s"        => "s",
    "t"        => "\u{0287}",
    "u"        => "n",
    "v"        => "\u{028C}",
    "w"        => "\u{028D}",
    "x"        => "x",
    "y"        => "\u{028E}",
    "z"        => "z",
    "A"        => "\u{0250}",
    "B"        => "q",
    "C"        => "\u{0254}",
    "D"        => "p",
    "E"        => "\u{01DD}",
    "F"        => "\u{025F}",
    "G"        => "\u{0183}",
    "H"        => "\u{0265}",
    "I"        => "\u{0131}",
    "J"        => "\u{027E}",
    "K"        => "\u{029E}",
    "L"        => "|",
    "M"        => "\u{026F}",
    "N"        => "u",
    "O"        => "o",
    "P"        => "d",
    "Q"        => "b",
    "R"        => "\u{0279}",
    "S"        => "s",
    "T"        => "\u{0287}",
    "U"        => "n",
    "V"        => "\u{028C}",
    "W"        => "\u{028D}",
    "X"        => "x",
    "Y"        => "\u{028E}",
    "Z"        => "z",
    "."        => "\u{02D9}",
    "["        => "]",
    "'"        => ",",
    ","        => "'",
    "("        => ")",
    "{"        => "}",
    "?"        => "\u{00BF}",
    "!"        => "\u{00A1}",
    "\""       => ",",
    "<"        => ">",
    "_"        => "\u{203E}",
    ";"        => "\u{061B}",
    "]"        => "[",
    ","        => "'",
    "'"        => ",",
    ")"        => "(",
    "}"        => "{",
    "\u{00BF}" => "?",
    "\u{00A1}" => "!",
    "'"        => "\"",
    ">"        => "<",
    "\u{203E}" => "_",
    "\u{061B}" => ";",
    "\u{203F}" => "\u{2040}",
    "\u{2045}" => "\u{2046}",
    "\u{2234}" => "\u{2235}",
    "\r"       => "\n",
    " "        => " ",
    "1"        => "\u0196",
    "2"        => "\u1105",
    "3"        => "\u0190",
    "4"        => "\u3123",
    "5"        => "\u03DB",
    "6"        => "9",
    "7"        => "\u3125",
    "8"        => "8",
    "9"        => "6",
    "0"        => "0"
  }

  def flip_it(string)
     string.each_char.reduce("") do |m,char|
       m += flip_char(char)
     end.downcase.reverse
  rescue CharNotAvailableError
    wah_wah
  end

  private

  def wah_wah
    WahWah.sample
  end

  def flip_char(char)
    Fliptable.fetch(char) do
      Fliptable.invert.fetch(char) { raise CharNotAvailableError}
    end
  end
end
