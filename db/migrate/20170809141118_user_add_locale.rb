class UserAddLocale < ActiveRecord::Migration[5.1]
  def change
    change_table(:users) do |t|
      t.column :locale, :string, limit: 60
    end
  end
end
