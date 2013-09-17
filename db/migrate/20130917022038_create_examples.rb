class CreateExamples < ActiveRecord::Migration
  def change
    create_table :examples do |t|
      t.string :title
      t.text :text
      t.integer :year

      t.timestamps
    end
  end
end
