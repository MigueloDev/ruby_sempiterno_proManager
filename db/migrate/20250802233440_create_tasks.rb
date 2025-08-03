class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.string :status, default: 'pending'
      t.date :due_date
      t.references :project, null: false, foreign_key: true
      t.references :assigned_to, null: true, foreign_key: { to_table: :users }
      t.references :created_by, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end

    add_index :tasks, :status
    add_index :tasks, :due_date
  end
end