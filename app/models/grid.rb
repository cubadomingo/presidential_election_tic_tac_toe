class Grid < ApplicationRecord
  has_one :game
  # check for edgecase of '' nil being equal

  def won?
    if (diagonal_match || across_match || down_match)
      return true
    end
    return false
  end

  def stalemate?
    if !self.won? && (row1_check && row2_check && row3_check)
      return true
    end
  end

  def row1_check
    row1.all? { |x| x == "X" || x == "O" }
  end

  def row2_check
    row2.all? { |x| x == "X" || x == "O" }

  end

  def row3_check
    row3.all? { |x| x == "X" || x == "O" }
  end

  def move!(row, location, play)
    case row
    when "1"
      self.row1[location.to_i] = play
      self.save
    when "2"
      self.row2[location.to_i] = play
      self.save
    when "3"
      self.row3[location.to_i] = play
      self.save
    else
      #do nothing
    end
  end

  def diagonal_match
      if (row1[0] == row2[1]) && (row2[1] == row3[2])
        return !row1[0].empty?
      elsif (row1[2] == row2[1]) && (row2[1] == row3[0])
        return !row1[2].empty?
      end
    return false
  end

  def across_match
      if row1[0] == row1[1] && row1[1] == row1[2]
        return !row1[0].empty?
      elsif row2[0] == row2[1] && row2[1] == row2[2]
        return !row2[0].empty?
      elsif row3[0] == row3[1] && row3[1] == row3[2]
        return !row3[0].empty?
      end
    return false
  end

  def down_match
    if row1[0] == row2[0] && row2[0] == row3[0]
      return !row1[0].empty?
    elsif row1[1] == row2[1] && row2[1] == row3[1]
      return !row1[1].empty?
    elsif row1[2] == row2[2] && row2[2] == row3[2]
      return !row1[2].empty?
    end
    return false
  end
end
