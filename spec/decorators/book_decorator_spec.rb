require 'spec_helper'

describe BookDecorator do
  let(:book) do
    create(:book).decorate
  end

  it 'should return the price form €' do
    expect(book.price_from_euro).to eq("€#{book.price}")
  end

  it 'should return Reviews (0) ' do
    expect(book.rev_count).to eq('Reviews (0)')
  end

end
