class AddColumnLayoutToDocs < ActiveRecord::Migration[6.0]
  def change
    add_column :docs, :layout_id, :integer
  end
end
