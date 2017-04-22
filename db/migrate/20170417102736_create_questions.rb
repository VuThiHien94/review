class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :file1
      t.string :file2
      t.integer :flag

      t.timestamps
    end
  end
end
