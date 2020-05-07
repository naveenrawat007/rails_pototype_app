class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :task_date
      t.time :task_time
      t.string :type
      t.timestamps
    end
  end
end
