class AddResourcesColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :glacons, :header, :string
    add_column :glacons, :thumbnail, :string
  end
end
