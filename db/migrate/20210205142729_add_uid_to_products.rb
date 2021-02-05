class AddUidToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :glacons, :uuid, :string
    add_column :glacons, :slug, :string
  end
end
