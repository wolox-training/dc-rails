class ExternalBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :external_books do |t|
      t.json :data, null: false
      t.string :worker_id, null: false
      t.string :isbn, null: false
    end
  end
end
