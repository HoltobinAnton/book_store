require 'spec_helper'

describe BookDecorator do
  let(:book) do
    create(:book).decorate
  end

  it 'should return the price form €' do
    expect(book.price_from_euro).to eq("€#{book.price}")
  end

  it 'should return authors_list' do
    expect(book.authors_list).to eq('Fname2 Lname2, Fname Lname')
  end

  it 'should return materails list' do
    expect(book.materials_list).to eq('Carton, Design')
  end
end
