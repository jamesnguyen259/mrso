class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :rating
      t.references :user
      t.references :review
    end
  end
end
