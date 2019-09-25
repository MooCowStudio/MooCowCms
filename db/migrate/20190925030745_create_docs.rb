class CreateDocs < ActiveRecord::Migration[6.0]
  def change
    create_table :docs do |t|
      t.references :site
      t.string :title
      t.text :body
      t.string :filename

      t.timestamps
    end
  end
end
