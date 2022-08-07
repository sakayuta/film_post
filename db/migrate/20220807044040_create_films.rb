class CreateFilms < ActiveRecord::Migration[6.1]
  def change
    create_table :films do |t|
      t.integer :user_id, null: false
      t.integer :genre_id, null: false
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
