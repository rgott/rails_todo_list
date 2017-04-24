class AddPositionToTodoItem < ActiveRecord::Migration
  def change
    add_column :todo_items, :position, :integer
  end
end
