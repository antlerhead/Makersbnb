feature 'list of spaces' do
  scenario 'user can view a list of spaces' do
    connection = PG.connect(dbname: 'makersbnb_test')

    connection.exec("INSERT INTO spaces (name, description, price, fromdate, todate, booking_id, host) VALUES('Blossom Villa', 'Pretty villa', 150.00, '2021-10-01', '2021-10-07', 10 , 1 );")
    
    visit ('/')

    expect(page).to have_content "Blossom Villa"
  end
end

