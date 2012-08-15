

assert = require 'assert'
Str    = require 'string_da99'


describe "Stringy", () ->

  describe ".whitespace_split()", () ->
    it "splits string on whitespace", () ->
      assert.deepEqual Str("a\tb\nc").whitespace_split(), ["a", "b", "c"]
      
    it "ignores any beginning/ending whitespace", () ->
      assert.deepEqual Str("\ta\nb").whitespace_split(), ["a", "b"]
      
  describe ".strip()", () ->
    it "removes all whitespace", () ->
      assert.equal Str(" a ").strip(), "a"

  describe ".is_empty()", () ->
    it "returns true if length is 0", () ->
      assert.equal Str("").is_empty(), true
      
    it "returns false if it contains nothing but whitespace", () ->
      assert.equal Str(" ").is_empty(), false

  describe ".is_whitespace()", () ->
    it "returns true if contains nothing but whitespace", () ->
      assert.equal Str(" ").is_whitespace(), true
      
    it "returns true if empty", () ->
      assert.equal Str("").is_whitespace(), true

  describe ".remove_indentation()", () ->
    it "removes beginning indentation of each line.", () ->
      str = "  a\n  b\n  c"
      assert.equal Str(str).remove_indentation(), "a\nb\nc"
      
    it "returns same string if first line has no indentation", () ->
      str = "a\n  b\n  c"
      assert.equal Str(str).remove_indentation(), str
      
    it "does not remove lines with only whitespace", () ->
      str = "  a\n    \n  b"
      assert.equal Str(str).remove_indentation(), "a\n  \nb"
      
    it "does not remove empty lines after de-indentation", () ->
      str = "  a\n  \n  b"
      assert.equal Str(str).remove_indentation(), "a\n\nb"

  describe '.remove_end( char )', () ->
    
    it 'removes ending period: .', () ->
      str = "i love ice cream"
      assert.equal Str("#{str}.").remove_end('.'), str
      
    it 'removes ending colon: :', () ->
      str = "i love cheesecake"
      assert.equal Str("#{str}:").remove_end(':'), str
      
    it 'removes random char: ^', () ->
      str = "^i love Heaven"
      assert.equal Str("#{str}^").remove_end('^'), str
      
      
