class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :content
      t.string :difficulty
      t.string :inc1
      t.string :inc2
      t.string :inc3
      t.string :correct
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
