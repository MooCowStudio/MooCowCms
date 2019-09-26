class CreateAccessLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :access_logs do |t|
      t.references :site, null: false, foreign_key: true
      t.references :doc, null: false, foreign_key: true

      t.timestamps
    end
  end
end
