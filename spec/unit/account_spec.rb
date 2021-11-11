require './app'
require 'setup_test_database'
require './lib/account'

describe 'Account' do
  it 'Can add a new account' do
    setup_test_database
    Account.add(name: "Mickey Mouse", login: "Mickey@disney.com", password: 1234, host: 1, signedin: 1, booking_id: 0)
    expect(Account.all.last.name).to include "Mickey Mouse"
  end
 
  # (id SERIAL PRIMARY KEY, name VARCHAR(60), login VARCHAR(60), password VARCHAR(60), host BIT, signedin BIT, booking_id INTEGER);

end
