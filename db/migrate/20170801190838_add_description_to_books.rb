class AddDescriptionToBooks < ActiveRecord::Migration[5.1]
  def change
    change_table(:books) do |t|
      t.column :description, :string, limit: 60
    end
  end
end
