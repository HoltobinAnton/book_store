class AddDimensionRefToBook < ActiveRecord::Migration[5.0]
  def change
    add_reference :books, :dimension, index: true
  end
end
