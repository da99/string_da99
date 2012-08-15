
String_da99 =

  HEAD_WHITE_SPACE: /^[\s]+/
  END_PERIOD: /\.$/
  END_COLON : /\:$/
  WHITESPACE: /[\s]+/
  
  da99:
    regexp: (name) ->
      val = String_da99[name]
      if !val
        throw new Error("RegExp, #{name}, not found.")
      val

  standardize: () ->
    this.replace(/\t/, "  ").replace(/\r/, "")
    
  strip: () ->
    this.replace(/^\s+|\s+$/g, '')
    
  is_empty: () ->
    this.length is 0

  is_whitespace: () ->
    return( @strip().length is 0 )
  
  begins_with_whitespace: () ->
    @HEAD_WHITE_SPACE.test this
  has_end_period: () ->
    @END_PERIOD.test this
  has_end_colon: () ->
    @END_COLON.test this
    
  remove_end: (type) ->
    val = switch type
      when ".", "period"
        this.replace @END_PERIOD, ""
      when ":", "colon"
        this.replace @END_COLON, ""
      else
        this.replace (new RegExp("\\#{type}$")), ""
    val

  strip_beginning_empty_lines: (lines) ->
    arr = []
    for line in lines
      if (line.englishy('strip') != "" )
        arr.push line
    arr
  
  remove_indentation: () ->
    return "" if @strip() is ""
    lines = ( this.split("\n") )
    indent_meta= @HEAD_WHITE_SPACE.exec(lines[0])
    if !indent_meta
      return lines.join("\n")
    indent = indent_meta[0]
    final = (l.replace(indent, "") for l in lines)
    final.join("\n")
  
  whitespace_split: () ->
    @strip().split @da99.regexp('WHITESPACE')
    
for k, v of String_da99
  if !String.prototype[k] 
    String.prototype[k] = String_da99[k]
      
module.exports = (str) ->
  new String_da99(str)
