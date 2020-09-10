class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.integer :priority, default: 0, null: false
      t.boolean :completed, default: false, null: false
      t.date :deadline, default: Date.today, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
