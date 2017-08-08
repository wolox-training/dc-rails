class AddTime < ActiveRecord::Migration[5.1]
  def change
    add_timestamps :books, default: DateTime.now
  end
end
