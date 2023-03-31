class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :folder

      t.string :text, null: false
      t.string :status, null: false
      t.datetime :deadline
      t.timestamps
    end
  end
end
