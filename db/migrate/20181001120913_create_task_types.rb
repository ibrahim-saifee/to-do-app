class CreateTaskTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :task_types do |t|
      t.string :name, default: ''
      t.timestamps
    end
  end
end
