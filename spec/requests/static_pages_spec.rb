require 'spec_helper'


describe "Initial tests: " do
  
  
  
  scenario "Visit index page without login not fail" do 
    #When one visits index without login redirect to login page
    visit (todo_lists_path)
    expect(page.status_code).to eq(200)
    expect(page).to have_content('Login')
  end


  describe "GET /static_pages" do
  # not pass to index without login	
    it "test home page of application" do
      visit '/todo_lists/index'
      expect(page).not_to have_content('Listing Todo Lists')
    end
  end
end
