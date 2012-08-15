class String_da99
  @HEAD_WHITE_SPACE = /^[\s]+/
  @END_PERIOD = /\.$/
  @END_COLON  = /\:$/
  @WHITESPACE = /[\s]+/
  
  constructor: (parent) ->
    @str = parent
    @HEAD_WHITE_SPACE = @constructor.HEAD_WHITE_SPACE
    @END_PERIOD       = @constructor.END_PERIOD
    @END_COLON        = @constructor.END_COLON
    
  regexp: (name) ->
    val = @constructor[name]
    if !val
      throw new Error("RegExp, #{name}, not found.")
    val

  standardize: () ->
    @str.replace(/\t/, "  ").replace(/\r/, "")
    
  strip: () ->
    @str.replace(/^\s+|\s+$/g, '')
    
  is_empty: () ->
    @str.length is 0

  is_whitespace: () ->
    return( @strip().length is 0 )
  
  begins_with_whitespace: () ->
    @HEAD_WHITE_SPACE.test @str
  has_end_period: () ->
    @END_PERIOD.test @str
  has_end_colon: () ->
    @END_COLON.test @str
    
  remove_end: (type) ->
    switch type
      when ".", "period"
        @str.replace @END_PERIOD, ""
      when ":", "colon"
        @str.replace @END_COLON, ""
      else
        @str.replace (new RegExp("\\#{type}$")), ""

  strip_beginning_empty_lines: (lines) ->
    arr = []
    for line in lines
      if (line.englishy('strip') != "" )
        arr.push line
    arr
  
  remove_indentation: () ->
    return "" if @strip() is ""
    lines = ( @str.split("\n") )
    indent_meta= @HEAD_WHITE_SPACE.exec(lines[0])
    if !indent_meta
      return lines.join("\n")
    indent = indent_meta[0]
    final = (l.replace(indent, "") for l in lines)
    final.join("\n")
  
  whitespace_split: () ->
    @strip().split @regexp('WHITESPACE')
    
module.exports = (str) ->
  new String_da99(str)
