class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :name
      t.text :description
      t.string :picture
      t.datetime :release_day
      t.string :duration
      t.string :author

      t.timestamps
    end
  end
end
