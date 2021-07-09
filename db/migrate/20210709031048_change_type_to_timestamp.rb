class ChangeTypeToTimestamp < ActiveRecord::Migration[5.2]
  def change
    change_column :view_parties, :event_time, :timestamp
  end
end
