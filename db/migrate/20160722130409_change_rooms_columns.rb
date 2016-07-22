class ChangeRoomsColumns < ActiveRecord::Migration
  def change
    change_column_null(:rooms, :title, false)
    change_column_null(:rooms, :location, false)
    change_column_null(:rooms, :description, false)
  end
end
