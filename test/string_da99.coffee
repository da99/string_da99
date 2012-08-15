

assert = require 'assert'
Str    = require 'string_da99'


describe "Stringy", () ->

  describe ".whitespace_split()", () ->
    it "splits string on whitespace", () ->
      assert.deepEqual "a\tb\nc".whitespace_split(), ["a", "b", "c"]
      
    it "ignores any beginning/ending whitespace", () ->
      assert.deepEqual "\ta\nb".whitespace_split(), ["a", "b"]
      
  describe ".strip()", () ->
    it "removes all whitespace", () ->
      assert.equal " a ".strip(), "a"

  describe ".is_empty()", () ->
    it "returns true if length is 0", () ->
      assert.equal "".is_empty(), true
      
    it "returns false if it contains nothing but whitespace", () ->
      assert.equal " ".is_empty(), false

  describe ".is_whitespace()", () ->
    it "returns true if contains nothing but whitespace", () ->
      assert.equal " ".is_whitespace(), true
      
    it "returns true if empty", () ->
      assert.equal "".is_whitespace(), true

  describe ".remove_indentation()", () ->
    it "removes beginning indentation of each line.", () ->
      str = "  a\n  b\n  c"
      assert.equal str.remove_indentation(), "a\nb\nc"
      
    it "returns same string if first line has no indentation", () ->
      str = "a\n  b\n  c"
      assert.equal (str).remove_indentation(), str
      
    it "does not remove lines with only whitespace", () ->
      str = "  a\n    \n  b"
      assert.equal (str).remove_indentation(), "a\n  \nb"
      
    it "does not remove empty lines after de-indentation", () ->
      str = "  a\n  \n  b"
      assert.equal (str).remove_indentation(), "a\n\nb"

  describe '.remove_end( char )', () ->
    
    it 'removes ending period: .', () ->
      str = "i love ice cream"
      assert.equal ("#{str}.").remove_end('.'), str
      
    it 'removes ending colon: :', () ->
      str = "i love cheesecake"
      assert.equal ("#{str}:").remove_end(':'), str
      
    it 'removes random char: ^', () ->
      str = "^i love Heaven"
      assert.equal ("#{str}^").remove_end('^'), str
      
      
