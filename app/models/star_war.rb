class StarWar < ApplicationRecord
  validates :character, :planet, :quote, presence: true
  def saying
    "While on #{planet}, #{character} says '#{quote}'"
  end
end
