class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :feed_url
      t.string :title
      t.text :description
      t.string :url

      t.timestamps
    end
    add_index :channels, :feed_url, :unique => true
  end
end

