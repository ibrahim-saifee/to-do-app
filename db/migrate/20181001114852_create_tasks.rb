class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title, default: ''
      t.text :description
      t.integer :position
      t.integer :status, default: 'pending'
      t.belongs_to :task_type
      t.datetime :due_date
      t.timestamps
    end
  end
end
