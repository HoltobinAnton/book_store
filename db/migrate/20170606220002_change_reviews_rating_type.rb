class ChangeReviewsRatingType < ActiveRecord::Migration[5.0]
  def up
    change_table :reviews do |t|
      t.change :rating, :integer, default: 1
    end
  end

  def down
    change_table :reviews do |t|
      t.change :rating, :float
    end
  end
end
