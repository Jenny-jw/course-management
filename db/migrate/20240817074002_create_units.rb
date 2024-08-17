class CreateUnits < ActiveRecord::Migration[7.2]
  def change
    create_table :units do |t|
      t.string :unit_name
      t.text :unit_description
      t.text :unit_content
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
