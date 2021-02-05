class PlsWorkNow < ActiveRecord::Migration[6.0]
  def change
    remove_column :glacons, :uuid
    remove_index :glacons, :uuid
  end
end
