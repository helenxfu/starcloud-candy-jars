class RemoveDefaultDateFromTasks < ActiveRecord::Migration[5.1]
  def change
    change_column_default :tasks, :deadline, nil
  end
end
