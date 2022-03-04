# author: Ben Thicmaw

INCLUDE libs/functional_loops.ink


// Test Functional Loops

VAR _TEST_COUNTER = 0
LIST TEST_ITEMS = ITEM1, ITEM2, ITEM3, ITEM4


== function test_functional_loops()
    test_functional_loops()
    ~ test_for()
    ~ test_for_1()
    ~ test_for_2()
    ~ test_for_each()
    ~ test_for_each_1()
    ~ test_for_each_2()
    ~ test_while()
    ~ test_while_1()
    ~ test_while_2()


// For loops

== function test_for()
    ~ _TEST_COUNTER = 0
    
    ~ for( 6, -> _test_for_func )
    
    >> { _TEST_COUNTER == 15: PASS | FAIL } [ test_for() ]

== function _test_for_func( index )
    ~ _TEST_COUNTER += index


== function test_for_1()
    ~ _TEST_COUNTER = 0
    
    ~ for_1( 6, -> _test_for_func_1, 1 )
    >> { _TEST_COUNTER == 21: PASS | FAIL } [ test_for_1() ]

== function _test_for_func_1( index, arg1 )
    ~ _TEST_COUNTER += ( index + arg1 )


== function test_for_2()
    ~ _TEST_COUNTER = 0
    
    ~ for_2( 6, -> _test_for_func_2, 1, 2 )

    >> { _TEST_COUNTER == 27: PASS | FAIL } [ test_for_2() ]

== function _test_for_func_2( index, arg1, arg2 )
    ~ _TEST_COUNTER += ( index + ( arg1 * arg2 ) )


// For Each Loops

== function test_for_each()
    ~ _TEST_COUNTER = 0
    
    ~ for_each( ( ITEM1, ITEM2, ITEM3 ), -> _test_for_each_func)

    >> { _TEST_COUNTER == 6: PASS | FAIL } [ test_for_each() ]

== function _test_for_each_func( index, element )
    ~ _TEST_COUNTER += LIST_VALUE( element )


== function test_for_each_1()
    ~ _TEST_COUNTER = 0
    
    ~ for_each_1( ( ITEM1, ITEM2 ), -> _test_for_each_1_func, ( ITEM3, ITEM4 ) )
    
    >> { _TEST_COUNTER == 7: PASS | FAIL } [ test_for_each_1() ]


== function _test_for_each_1_func( index, element, arg1 )
    ~ _TEST_COUNTER += LIST_VALUE( element ) + LIST_COUNT( arg1 )


== function test_for_each_2()
    ~ _TEST_COUNTER = 0
    
    ~ for_each_2( ( ITEM1, ITEM2 ), -> _test_for_each_2_func, ( ITEM3, ITEM4 ), 2 )
    
    >> { _TEST_COUNTER == 11: PASS | FAIL } [ test_for_each_2() ]


== function _test_for_each_2_func( index, element, arg1, arg2 )
    ~ _TEST_COUNTER += LIST_VALUE( element ) + ( LIST_COUNT( arg1 ) * arg2 )


// While Loops

== function _test_while_condition( index )
    ~ return index < 4

== function _test_while_func( index )
    ~ _TEST_COUNTER += index

== function test_while()
    ~ _TEST_COUNTER = 0

    ~ while( -> _test_while_condition, -> _test_while_func )
    
    >> { _TEST_COUNTER == 6: PASS | FAIL } [ test_while() ]

== function _test_while_1_condition( index, arg1 )
    ~ return index < 4

== function _test_while_1_func( index, arg1 )
    ~ _TEST_COUNTER += index

== function test_while_1()
    ~ _TEST_COUNTER = 0

    ~ while_1( -> _test_while_1_condition, -> _test_while_1_func, LIST_ALL( TEST_ITEMS ) )
    
    >> { _TEST_COUNTER == 6: PASS | FAIL } [ test_while_1() ]

== function _test_while_2_condition( index, arg1, arg2 )
    ~ return index < 4

== function _test_while_2_func( index, arg1, arg2 )
    ~ _TEST_COUNTER += ( index * arg2 )

== function test_while_2()
    ~ _TEST_COUNTER = 0

    ~ while_2( -> _test_while_2_condition, -> _test_while_2_func, LIST_ALL( TEST_ITEMS ), 2 )

    >> { _TEST_COUNTER == 12: PASS | FAIL } [ test_while_2() ]


// END