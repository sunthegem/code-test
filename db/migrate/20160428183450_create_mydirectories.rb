class CreateMydirectories < ActiveRecord::Migration
  def change
    create_table :mydirectories do |t|
      t.string :name
      t.references :mydirectory, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
