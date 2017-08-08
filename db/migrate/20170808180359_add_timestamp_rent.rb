class AddTimestampRent < ActiveRecord::Migration[5.1]
  def change
    add_timestamps :rents, default: DateTime.now
  end
end
