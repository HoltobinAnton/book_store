require 'rails_helper'

RSpec.describe Picture, type: :model do
  describe 'Association' do
    it { is_expected.to belong_to(:imageable) }
  end
end
