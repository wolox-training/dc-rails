class Rents < ActiveRecord::Migration[5.1]
  def change
    create_table :rents do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.datetime :from, null: false
      t.datetime :to, null: false
    end
  end
end
