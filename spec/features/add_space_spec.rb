feature 'Add new spaces' do
  scenario 'user can add a new space' do
    connection = PG.connect(dbname: 'makersbnb_test')

    connection.exec("INSERT INTO spaces VALUES(1,'Blossom Villa', 'Pretty villa', 150.00, '2021-10-01', '2021-10-07', 10 , 1 );")
    
    visit ('/')
    click_button(:add_space) # This takes us to a new page to fill in
    fill_in 'name', with: "Monsters Inc"
    fill_in 'description', with: "Faulous University residence"
    fill_in 'price', with: "120"
    fill_in 'from_date', with: "2021-12-01"
    fill_in 'to_date', with: "2021-12-31"
    click_button(:submit) # This takes us back to the listing page
    expect(page).to have_content "Monsters Inc"

  end
end

