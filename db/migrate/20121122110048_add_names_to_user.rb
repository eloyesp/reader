class AddNamesToUser < ActiveRecord::Migration

  def change
    change_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.remove :name
      t.string :login, :null => false, :default => ""
      t.index  :login, :unique => true
    end
  end

end
