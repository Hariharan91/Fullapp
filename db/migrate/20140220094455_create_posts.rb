class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.references :model, index: true

      t.timestamps
    end
  end
end
