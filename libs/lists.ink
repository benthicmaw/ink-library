# author: Ben Thicmaw


// Push/pop

=== function push( ref list, item )
    ~ list += item
    ~ return list

=== function pop( ref list )
    ~ temp element = LIST_MIN( list )
    ~ list -= element
    ~ return element
