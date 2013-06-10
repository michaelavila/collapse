Feature: Collapse directories

    Scenario: Collapse a single directory
        Given a directory named "testdir/"
        And an empty file named "testdir/testfile"
        And a file named "testfile" should not exist
        When I successfully run `collapse testdir`
        Then a file named "testfile" should exist
        And a directory named "testdir" should not exist

    Scenario: Collapse directories recursively
        Given a directory named "testdirouter/testdirinner"
        And an empty file named "testdirouter/testfileouter"
        And an empty file named "testdirouter/testdirinner/testfileinner"
        And a file named "testfileouter" should not exist
        And a file named "testfileinner" should not exist
        When I successfully run `collapse -r testdirouter`
        Then a file named "testfileouter" should exist
        And a file named "testfileinner" should exist
        And a directory named "testdirouter" should not exist

    Scenario: Collapse a directory with an inner file named the same
        Given a directory named "testdir/"
        And an empty file named "testdir/testdir"
        When I successfully run `collapse testdir`
        Then a file named "testdir" should exist
        And a directory named "testdir" should not exist
