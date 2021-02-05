class ChangeProductFieldTypes < ActiveRecord::Migration[6.0]
  def change
    remove_column :glacons, :uuid
    add_column :glacons, :uuid, :string
  end
end
