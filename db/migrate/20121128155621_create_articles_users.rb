class CreateArticlesUsers < ActiveRecord::Migration
  def change
    create_table :articles_users do |t|
      t.references :article
      t.references :user
    end

    add_index :articles_users, :article_id
    add_index :articles_users, :user_id
  end
end

