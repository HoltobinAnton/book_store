class AddColumnStateToReview < ActiveRecord::Migration[5.0]
  def self.up
    add_column :reviews, :state, :string, default: 'in_draft'
  end

  def self.down
    remove_column :reviews, :state
  end
end
