
string\_da99
===========

My helper functions for strings. 


Install & Use
============

In your shell:

    npm install string_da99


In your CoffeeScript:

    Str = require 'string_da99'

    Str("\n").is_whitespace() # ---> true
    Str(" a ").strip()        # --> "a"
    Str("").is_empty()        # --> true
    Str("A b c.").remove_end( '.' ) # --> "A b c"
    
    Str("Shutdown the govt schools.").whitespace_split()
    # -> [ "Shutdown", "the", "govt", "schools." ]

    Str("  a\n  b\n  c").remove_indentation()
    # -> "a\nb\nc"
    
    

