class Game < ApplicationRecord
  belongs_to :grid

  def next_player
    if self.turn == "trump"
      self.turn = "hillary"
      self.save
    elsif self.turn == "hillary"
      self.turn = "trump"
      self.save
    end
  end
end

#tie is when everyone is filled but no one one
