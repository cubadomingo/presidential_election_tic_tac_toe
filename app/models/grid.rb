class Grid < ApplicationRecord
  has_one :game
  # check for edgecase of '' nil being equal

  def won?
    if (!diagonal_match.empty? || !across_match.empty? || !down_match.empty?)
      return true
    end
    return false
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
        return row1[0]
      elsif (row1[2] == row2[1]) && (row2[1] == row3[0])
        return row1[2]
      end
    return ""
  end

  def across_match
      if row1[0] == row1[1] && row1[1] == row1[2]
        return row1[0]
      elsif row2[0] == row2[1] && row2[1] == row2[2]
        return row2[0]
      elsif row3[0] == row3[1] && row3[1] == row3[2]
        return row3[0]
      end
    return ""
  end

  def down_match
    if row1[0] == row2[0] && row2[0] == row3[0]
      return row1[0]
    elsif row1[1] == row2[1] && row2[1] == row3[1]
      return row1[1]
    elsif row1[2] == row2[2] && row2[2] == row3[2]
      return row1[2]
    end
    return ""
  end
end
