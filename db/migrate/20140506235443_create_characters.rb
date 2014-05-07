class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :short_desc
      t.text :description
      t.string :url
      t.string :image_url

      t.timestamps
    end
  end
end
