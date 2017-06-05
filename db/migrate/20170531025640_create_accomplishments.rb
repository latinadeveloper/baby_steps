class CreateAccomplishments < ActiveRecord::Migration[5.1]
  def change
    create_table :accomplishments do |t|
      t.belongs_to :child
      t.belongs_to :skill
      t.boolean :perform
      t.string :comment

      t.timestamps
    end
  end
end
