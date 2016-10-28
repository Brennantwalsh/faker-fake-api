class CreateStarWars < ActiveRecord::Migration[5.0]
  def change
    create_table :star_wars do |t|
      t.string :character
      t.string :planet
      t.string :quote

      t.timestamps
    end
  end
end
