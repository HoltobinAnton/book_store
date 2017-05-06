require 'spec_helper'

describe BookDecorator do
  let(:book) do
    create(:book).decorate
  end

  it 'should return authors_list' do
    expect(book.authors_list).to eq('Fname Lname, Fname2 Lname2')
  end

  it 'should return materails list' do
    expect(book.materials_list).to eq('Design, Carton')
  end
end
