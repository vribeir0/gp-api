class CreateFolders < ActiveRecord::Migration[7.0]
  def change
    create_table :folders do |t|
      t.belongs_to :user 

      t.string :name, null: false
      t.integer :parent_id
      t.timestamps
    end
  end
end
