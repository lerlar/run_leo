import unittest
from run_leo.core import import_leo_program


class TestLeoProgram(unittest.TestCase):

    def test_load_leo_program(self):
        ttt = import_leo_program('./leo_examples/tictactoe')

        # Test if structs are successfully converted to class variables
        self.assertTrue(hasattr(ttt, "Row"))
        self.assertTrue(hasattr(ttt, "Board"))

        # Test if functions are successfully converted to class methods
        self.assertTrue(hasattr(ttt, "new"))
        self.assertTrue(hasattr(ttt, "make_move"))

        # Test class method calls
        print("""
###############################################################################
########                                                               ########
########          STEP 0: Creating a new game of Tic-Tac-Toe           ########
########                                                               ########
########                         |   |   |   |                         ########
########                         |   |   |   |                         ########
########                         |   |   |   |                         ########
########                                                               ########
###############################################################################
""")
        output = ttt.new()
        print(output)

        print("""
###############################################################################
########                                                               ########
########             STEP 1: Player 1 makes the 1st move.              ########
########                                                               ########
########                         | x |   |   |                         ########
########                         |   |   |   |                         ########
########                         |   |   |   |                         ########
########                                                               ########
###############################################################################
""")
        board = ttt.Board(r1=ttt.Row(c1=0, c2=0, c3=0),
                          r2=ttt.Row(c1=0, c2=0, c3=0),
                          r3=ttt.Row(c1=0, c2=0, c3=0))
        output = ttt.make_move(1, 1, 1, board)
        print(output)

        print("""
###############################################################################
########                                                               ########
########             STEP 2: Player 2 makes the 2nd move.              ########
########                                                               ########
########                         | x |   |   |                         ########
########                         |   | o |   |                         ########
########                         |   |   |   |                         ########
########                                                               ########
###############################################################################
""")
        board = ttt.Board(r1=ttt.Row(c1=1, c2=0, c3=0),
                          r2=ttt.Row(c1=0, c2=0, c3=0),
                          r3=ttt.Row(c1=0, c2=0, c3=0))
        output = ttt.make_move(2, 2, 2, board)
        print(output)

        print("""
###############################################################################
########                                                               ########
########             STEP 3: Player 1 makes the 3rd move.              ########
########                                                               ########
########                         | x |   |   |                         ########
########                         |   | o |   |                         ########
########                         | x |   |   |                         ########
########                                                               ########
###############################################################################
""")
        board = ttt.Board(r1=ttt.Row(c1=1, c2=0, c3=0),
                          r2=ttt.Row(c1=0, c2=2, c3=0),
                          r3=ttt.Row(c1=0, c2=0, c3=0))
        output = ttt.make_move(1, 3, 1, board)
        print(output)

        print("""
###############################################################################
########                                                               ########
########             STEP 4: Player 2 makes the 4th move.              ########
########                                                               ########
########                         | x |   |   |                         ########
########                         | o | o |   |                         ########
########                         | x |   |   |                         ########
########                                                               ########
###############################################################################
""")
        board = ttt.Board(r1=ttt.Row(c1=1, c2=0, c3=0),
                          r2=ttt.Row(c1=0, c2=2, c3=0),
                          r3=ttt.Row(c1=1, c2=0, c3=0))
        output = ttt.make_move(2, 2, 1, board)
        print(output)

        print("""
###############################################################################
########                                                               ########
########             STEP 5: Player 1 makes the 5th move.              ########
########                                                               ########
########                         | x |   |   |                         ########
########                         | o | o | x |                         ########
########                         | x |   |   |                         ########
########                                                               ########
###############################################################################
""")
        board = ttt.Board(r1=ttt.Row(c1=1, c2=0, c3=0),
                          r2=ttt.Row(c1=2, c2=2, c3=0),
                          r3=ttt.Row(c1=1, c2=0, c3=0))
        output = ttt.make_move(1, 2, 3, board)
        print(output)

        print("""
###############################################################################
########                                                               ########
########             STEP 6: Player 2 makes the 6th move.              ########
########                                                               ########
########                         | x | o |   |                         ########
########                         | o | o | x |                         ########
########                         | x |   |   |                         ########
########                                                               ########
###############################################################################
""")
        board = ttt.Board(r1=ttt.Row(c1=1, c2=0, c3=0),
                          r2=ttt.Row(c1=2, c2=2, c3=1),
                          r3=ttt.Row(c1=1, c2=0, c3=0))
        output = ttt.make_move(2, 1, 2, board)
        print(output)

        print("""
###############################################################################
########                                                               ########
########             STEP 7: Player 1 makes the 7th move.              ########
########                                                               ########
########                         | x | o |   |                         ########
########                         | o | o | x |                         ########
########                         | x | x |   |                         ########
########                                                               ########
###############################################################################
""")
        board = ttt.Board(r1=ttt.Row(c1=1, c2=2, c3=0),
                          r2=ttt.Row(c1=2, c2=2, c3=1),
                          r3=ttt.Row(c1=1, c2=0, c3=0))
        output = ttt.make_move(1, 3, 2, board)
        print(output)

        print("""
###############################################################################
########                                                               ########
########             STEP 8: Player 2 makes the 8th move.              ########
########                                                               ########
########                         | x | o |   |                         ########
########                         | o | o | x |                         ########
########                         | x | x | o |                         ########
########                                                               ########
###############################################################################
""")
        board = ttt.Board(r1=ttt.Row(c1=1, c2=2, c3=0),
                          r2=ttt.Row(c1=2, c2=2, c3=1),
                          r3=ttt.Row(c1=1, c2=1, c3=0))
        output = ttt.make_move(2, 3, 3, board)
        print(output)

        print("""
###############################################################################
########                                                               ########
########             STEP 9: Player 1 makes the 9th move.              ########
########                                                               ########
########                         | x | o | x |                         ########
########                         | o | o | x |                         ########
########                         | x | x | o |                         ########
########                                                               ########
###############################################################################
""")
        board = ttt.Board(r1=ttt.Row(c1=1, c2=2, c3=0),
                          r2=ttt.Row(c1=2, c2=2, c3=1),
                          r3=ttt.Row(c1=1, c2=1, c3=2))
        output = ttt.make_move(1, 1, 3, board)
        print(output)

        print("""
###############################################################################
########                                                               ########
########               Game Complete! Players 1 & 2 Tied               ########
########                                                               ########
########                         | x | o | x |                         ########
########                         | o | o | x |                         ########
########                         | x | x | o |                         ########
########                                                               ########
###############################################################################
""")


if __name__ == '__main__':
    unittest.main()
