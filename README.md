
string\_da99
===========

My helper functions for strings. 


Install & Use
============

In your shell:

    npm install string_da99


In your CoffeeScript:

    Str = require 'string_da99'

    "\n".is_whitespace() # ---> true
    " a ".strip()        # --> "a"
    "".is_empty()        # --> true
    "A b c.".remove_end( '.' ) # --> "A b c"
    
    "Shutdown the govt schools.".whitespace_split()
    # -> [ "Shutdown", "the", "govt", "schools." ]

    "  a\n  b\n  c".remove_indentation()
    # -> "a\nb\nc"
    
    

