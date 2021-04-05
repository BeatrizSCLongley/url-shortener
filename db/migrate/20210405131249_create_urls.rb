class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.text :long_url
      t.string :short_url
      t.integer :click, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
