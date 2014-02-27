class AddColumnsToModel < ActiveRecord::Migration
  def change
    add_column :models, :provider, :string
    add_column :models, :uid, :string
  end
end
