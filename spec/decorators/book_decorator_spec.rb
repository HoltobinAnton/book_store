require 'spec_helper'

describe BookDecorator do
  let(:book) do
    author1 = create(:author, first_name: 'Firstname1', last_name: 'Lastname1')
    author2 = create(:author, first_name: 'Firstname2', last_name: 'Lastname2')
    create(:book, authors: [author1, author2]).decorate
  end

  it 'should return authots_list' do
    expect(book.authors_list).to eq('Firstname1 Lastname1, Firstname2 Lastname2')
  end

end
