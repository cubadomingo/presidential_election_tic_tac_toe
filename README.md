# Presidential Tic Tac Toe

## Game Logic

The game of Tic Tac Toe has a 3 x 3 (3 rows, 3 columns) grid. A player begins the game with a move and then a second player makes a move until a player wins by matching the same symbol across, down, or diagonally. A new game begins with a new grid.

row1 = ["","",""]
row2 = ["","",""]
row3 = ["","",""]

#Win by:
  **Down**
  row1[0] == row2[0] && row2[0] == row3[0] unless value ''
  row1[1] == row2[1] && row2[1] == row3[1] unless value ''
  row1[2] == row2[2] && row2[2] == row3[2] unless value ''
  **Across**
  row1[0] == row1[1] && row1[1] == row1[2] unless value ''
  row2[0] == row2[1] && row2[1] == row2[2] unless value ''
  row3[0] == row3[1] && row3[1] == row3[2] unless value ''
  **Diagonal**
  row1[0] == row2[1] && row2[1] == row3[2] unless value ''
  row1[2] == row2[1] && row2[1] == row3[0] unless value ''

[yes] Game begins with blank grid.
[yes] After every move grid is updated.
[yes] After every grid update, grid is checked for winner.

trouble finding move functionality. How to update path

@grid.row1.flatten
