# author: Ben Thicmaw


// Functional Loops


// For loops

// Default `for` loop
=== function for( limit, -> func )
    ~ temp index = 0
    ~ _for( index, 1, limit, func )


// Parameterised `for` loop
== function _for( start, step, limit, -> func )
    ~ temp index = start
    ~ __for_loop( start, step, limit, func )


// Internal `for` loop
=== function __for_loop( index, step, limit, -> func )
    { index < limit:
        ~ func( index )
        ~ index += step
        ~ __for_loop( index, step, limit, func )
    }


// Default `for` loop with 1 argument
=== function for_1( limit, -> func, arg1 )
    ~ temp index = 0
    ~ _for_1( index, 1, limit, func, arg1 )

// Parameterised `for` loop with 1 argument
== function _for_1( start, step, limit, -> func, arg1 )
    ~ temp index = start
    ~ __for_loop_1( start, step, limit, func, arg1 )


// Internal `for` loop with 1 argument
=== function __for_loop_1( index, step, limit, -> func, arg1 )
    { index < limit:
        ~ func( index, arg1 )
        ~ index += step
        ~ __for_loop_1( index, step, limit, func, arg1 )
    }


// Default `for` loop with 2 arguments
=== function for_2( limit, -> func, arg1, arg2 )
    ~ temp index = 0
    ~ _for_2( index, 1, limit, func, arg1, arg2 )


// Parameterised `for` loop with 2 arguments
== function _for_2( start, step, limit, -> func, arg1, arg2 )
    ~ temp index = start
    ~ __for_loop_2( start, step, limit, func, arg1, arg2 )


// Internal `for` loop with 2 arguments
=== function __for_loop_2( index, step, limit, -> func, arg1, arg2 )
    { index < limit:
        ~ func( index, arg1, arg2 )
        ~ index += step
        ~ __for_loop_2( index, step, limit, func, arg1, arg2 )
    }
    

// For Each Loops

// Default `for_each` loop
=== function for_each( list, -> func )
    ~ temp index = 0
    ~ temp iter_list = list
    ~ _for_each_loop( index, iter_list, func )


// Internal `for_each` loop
=== function _for_each_loop( index, list, -> func )
    { list:
        ~ func( index, pop( list ) )
        ~ index ++
        ~ _for_each_loop( index, list, func )
    }


// Default `for_each` loop with 1 argument
=== function for_each_1( list, -> func, arg1 )
    ~ temp index = 0
    ~ temp iter_list = list
    ~ _for_each_loop_1( index, iter_list, func, arg1 )


// Internal `for_each` loop with 1 argument
=== function _for_each_loop_1( index, list, -> func, arg1 )
    { list:
        ~ func( index, pop( list ), arg1 )
        ~ index ++
        ~ _for_each_loop_1( index, list, func, arg1 )
    }


// Default `for_each` loop with 2 arguments
=== function for_each_2( list, -> func, arg1, arg2 )
    ~ temp index = 0
    ~ temp iter_list = list
    ~ _for_each_loop_2( index, iter_list, func, arg1, arg2 )


// Internal `for_each` loop with 2 arguments
=== function _for_each_loop_2( index, list, -> func, arg1, arg2 )
    { list:
        ~ func( index, pop( list ), arg1, arg2 )
        ~ index ++
        ~ _for_each_loop_2( index, list, func, arg1, arg2 )
    }


// While Loops

// Default `while` loop
=== function while( -> condition, -> func )
    ~ temp index = 0
    ~ _while_loop( index, condition, func )


// Internal `while` loop
=== function _while_loop( index, -> condition, -> func )
    { condition( index ):
        ~ func( index )
        ~ index ++
        ~ _while_loop( index, condition, func )
    }

// Default `while` loop with 1 argument
=== function while_1( -> condition, -> func, arg1 )
    ~ temp index = 0
    ~ _while_loop_1( index, condition, func, arg1 )


// Internal `while` loop with 1 argument
=== function _while_loop_1( index, -> condition, -> func, arg1 )
    { condition( index, arg1 ):
        ~ func( index, arg1 )
        ~ index ++
        ~ _while_loop_1( index, condition, func, arg1 )
    }

// Default `while` loop with 2 arguments
=== function while_2( -> condition, -> func, arg1, arg2 )
    ~ temp index = 0
    ~ _while_loop_2( index, condition, func, arg1, arg2 )


// Internal `while` loop with 2 arguments
=== function _while_loop_2( index, -> condition, -> func, arg1, arg2 )
    { condition( index, arg1, arg2 ):
        ~ func( index, arg1, arg2 )
        ~ index ++
        ~ _while_loop_2( index, condition, func, arg1, arg2 )
    }


// END