class AddStarToFilms < ActiveRecord::Migration[6.1]
  def change
    add_column :films, :star, :string
  end
end
