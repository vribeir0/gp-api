class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :text, null: false
      t.string :status, null: false
      t.datetime :deadline
    end
  end
end
