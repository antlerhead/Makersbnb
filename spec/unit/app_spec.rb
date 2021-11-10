require './app'
require 'setup_test_database'

describe 'Spaces' do
  
  it 'Can add a new space to spaces' do
    #Arrange
    setup_test_database
    #Apply 
    p Spaces.all
    Spaces.add(name: "Monsters Inc", description: "Fabulous university reisdence", price: "120", from_date: "2021-12-01", to_date: "2021-12-31" )
    #Action
    p Spaces.all.first.name
    expect(Spaces.all.first.name).to include "Monsters Inc"
  end

end
