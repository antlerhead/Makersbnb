feature 'Add new booking' do
  scenario 'user can add a new booking' do
    connection = PG.connect(dbname: 'makersbnb_test')
    visit ('/')
    click_button
    
    fill_in with: "2021-12-31"
   
    # fill_in 'to_date', with: "2021-12-31"
    click_button("Submit Query") 
    expect(page).to have_content "Monsters Inc"
  end
end
