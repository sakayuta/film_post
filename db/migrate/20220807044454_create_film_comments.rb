class CreateFilmComments < ActiveRecord::Migration[6.1]
  def change
    create_table :film_comments do |t|
      t.integer :film_id, null: false
      t.integer :user_id, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
