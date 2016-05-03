class CreateMyfiles < ActiveRecord::Migration
  def change
    create_table :myfiles do |t|
      t.string :name
      t.references :mydirectory, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
