class AddMainImageToDocs < ActiveRecord::Migration[6.0]
  def change
    add_column :docs, :image, :string
  end
end
