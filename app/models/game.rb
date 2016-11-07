class Game < ApplicationRecord
  def initialize
    @game = [
      ["X","O","X"],
      ["X","O","X"],
      ["X","X","X"]
    ]
  end

  def row1
    @game[0]
  end

  def row2
    @game[1]
  end

  def row3
    @game[2]
  end
end
