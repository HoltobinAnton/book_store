class RenameColumnFromPicture < ActiveRecord::Migration[5.0]
  def change
    rename_column :pictures, :name, :images
  end
end
