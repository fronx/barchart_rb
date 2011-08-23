# barchart_rb

simple command line bar chart inspired by (but simpler than) [data_hacks](https://github.com/bitly/data_hacks/blob/master/data_hacks/bar_chart.py).

## single chart

    $ echo "foo 1
    > bar 8
    > goo 14" | ruby barchart.rb

    foo [ 1] *
    bar [ 8] ********
    goo [14] **************

## multi-chart

    $ echo "a.foo 1
    > a.bar 8
    > a.goo 14
    > b.foo 445
    > b.bar 78
    > b.goo 13" | ruby barchart.rb

    # A
    foo [ 1] *
    bar [ 8] ********
    bar [14] **************

    # B
    # each * represents a count of 6
    foo [445] **************************************************************************
    bar [ 78] *************
    goo [ 13] **
