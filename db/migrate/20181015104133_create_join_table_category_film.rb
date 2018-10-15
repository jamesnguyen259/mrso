class CreateJoinTableCategoryFilm < ActiveRecord::Migration[5.2]
  def change
    create_join_table :categories, :films do |t|
      # t.index [:category_id, :film_id]
      # t.index [:film_id, :category_id]
    end
  end
end
