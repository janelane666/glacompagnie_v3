class PlsWorkNowpls < ActiveRecord::Migration[6.0]
  def change
    #remove_index :glacons, :uuid
    add_column :glacons, :uuid, :string
  end
end
