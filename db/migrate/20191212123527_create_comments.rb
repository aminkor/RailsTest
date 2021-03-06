class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :post, foreign_key: true, index: true
      t.string :name
      t.string :email
      t.text :body

      t.timestamps
    end
  end
end
