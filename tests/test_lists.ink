# author: Ben Thicmaw

INCLUDE libs/lists.ink


// Test Lists


LIST test_lists_items = item1, item2, item3, item4


== function test_lists()
    test_lists()
    ~ test_push()
    ~ test_pop()


// Push

VAR test_lists_list = ( item1, item2 )


=== function test_push()
    ~ push( test_lists_list, item3)
    >> { LIST_COUNT( test_lists_list ) == 3: PASS | FAIL } [ test_push() ]


=== function test_pop()
    ~ temp result = pop( test_lists_list )
    >> { LIST_COUNT( test_lists_list ) == 2: PASS | FAIL } [ test_pop() ]