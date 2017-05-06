require 'spec_helper'

describe BookDecorator do
  let(:book) do
    author1 = create(:author, first_name: 'Firstname1', last_name: 'Lastname1')
    author2 = create(:author, first_name: 'Firstname2', last_name: 'Lastname2')
    material = create(:material, title: 'Carton')
    create(:book, authors: [author1, author2], materials: [material]).decorate
  end

  it 'should return authors_list' do
    expect(book.authors_list).to eq('Firstname1 Lastname1, Firstname2 Lastname2')
  end

  it 'should return materails list' do
    expect(book.materials_list).to eq('Carton')
  end
end
