class RemoveReferenceOrderId < ActiveRecord::Migration[5.0]
  def change
    remove_reference :addresses, :order
  end
end
