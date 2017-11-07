class ChangeReviewsRating < ActiveRecord::Migration[5.0]
  def up
    change_table :reviews do |t|
      t.change :rating, :float
    end
  end

  def down
    change_table :reviews do |t|
      t.change :rating, :integer
    end
  end
end
