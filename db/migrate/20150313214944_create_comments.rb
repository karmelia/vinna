class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author_name
      t.text :body
      t.datetime :created_at,         null: false
      t.datetime :updated_at,         null: false
      t.references :post, index: true
    end
    add_foreign_key :comments, :posts
  end
end
