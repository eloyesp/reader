class CreateSuscriptions < ActiveRecord::Migration
  def change
    create_table :suscriptions do |t|
      t.belongs_to :user
      t.belongs_to :channel
      t.string :custom_title

      t.timestamps
    end
    add_index :suscriptions, :user_id
    add_index :suscriptions, :channel_id
  end
end
