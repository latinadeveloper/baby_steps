class CreateChildren < ActiveRecord::Migration[5.1]
  def change
    create_table :children do |t|
      t.belongs_to :user
      t.string :child_name
      t.integer :age

      t.timestamps
    end
  end
end
