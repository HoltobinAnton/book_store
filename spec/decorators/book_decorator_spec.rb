require 'spec_helper'

describe BookDecorator do
  let(:book) { create(:book).decorate }
end
