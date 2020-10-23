class CreateThemes < ActiveRecord::Migration[6.0]
  def change
    create_table :themes do |t|
      t.string :title
      t.belongs_to :user, null: false, foreign_key: true
    end
  end
end
