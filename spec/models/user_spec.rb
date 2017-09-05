require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:reviews) }

  it { should validate_length_of(:first_name).is_at_most(50) }
  it { should validate_length_of(:last_name).is_at_most(50) }

end
