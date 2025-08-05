class CreateMovies < ActiveRecord::Migration[8.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.references :genre, null: false, foreign_key: true
      t.string :url_string
      t.string :thumbnail_url_string

      t.timestamps
    end
  end
end
