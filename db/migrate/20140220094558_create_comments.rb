class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.references :model, index: true
      t.references :post, index: true

      t.timestamps
    end
  end
end
