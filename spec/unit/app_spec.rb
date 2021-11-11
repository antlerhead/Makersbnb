require './app'
require 'setup_test_database'

describe 'Spaces' do
  
  it 'Can add a new space to spaces' do
    setup_test_database
    Spaces.add(name: "Monsters Inc", description: "Fabulous university reisdence", price: "120", from_date: "2021-12-01", to_date: "2021-12-31" )
    expect(Spaces.all.first.name).to include "Monsters Inc"
  end

end
