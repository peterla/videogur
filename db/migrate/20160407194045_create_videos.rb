class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :author
      t.text :description
      t.integer :rating
      t.string :url

      t.timestamps null: false
    end
  end
end
