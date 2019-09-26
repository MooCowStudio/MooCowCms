class CreateLayouts < ActiveRecord::Migration[6.0]
  def change
    create_table :layouts do |t|
      t.references :site, null: false, foreign_key: true
      t.string :name
      t.string :filename
      t.text :content

      t.timestamps
    end
  end
end
