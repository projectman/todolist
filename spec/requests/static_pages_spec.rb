require 'spec_helper'


describe "Initial tests: " do
  
  
  
  describe "Visit Home without login" do 
    #When one visits index without login redirect to login page
    it "should redirect to Sign in page" do
      visit (todo_lists_path)
      expect(page.status_code).to eq(200)
      expect(page).to have_content('Sign in')
    end
  end


  describe "GET /static_pages" do
    # not pass to index without login	
    it "test home page of application" do
      visit '/todo_lists/index'
      expect(page).not_to have_content('Listing Todo Lists')
    end
  end

  # Prepare test for visiting whe user id is nil
  # Preoare test redirect "new user" works for no ID user
end
