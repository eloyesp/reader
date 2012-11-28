class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :channel
      t.string :title
      t.string :link
      t.text :description
      t.date :published_date

      t.timestamps
    end
    add_index :articles, :channel_id
    add_index :articles, :title
  end
end
