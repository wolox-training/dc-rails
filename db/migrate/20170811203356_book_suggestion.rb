class BookSuggestion < ActiveRecord::Migration[5.1]
  def change
    create_table :book_suggestions do |t|
      t.references :user, foreign_key: true
      t.string :author, null: false
      t.string :link, null: false
      t.string :title, null: false
      t.string :publisher, null: false
      t.string :year, null: false
      t.string :editorial, null: false
      t.float :price
      t.timestamps
    end
  end
end
