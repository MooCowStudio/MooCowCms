class CreateSites < ActiveRecord::Migration[6.0]
  def change
    create_table :sites do |t|
      t.string :name
      t.string :domain

      t.timestamps
    end
  end
end
