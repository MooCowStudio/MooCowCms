class AddDescriptionColumnToDocs < ActiveRecord::Migration[6.0]
  def change
    add_column :docs, :description, :text
  end
end
