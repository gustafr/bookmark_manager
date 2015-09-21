require 'link'

describe 'Link' do

  it 'has an array with links' do
  expect(Link.get_links).to be_kind_of Array
  end

end