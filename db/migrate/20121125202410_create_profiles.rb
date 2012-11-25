class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :max_channels_allowed

      t.timestamps
    end
    add_index :profiles, :name, :unique => true
  end
end
