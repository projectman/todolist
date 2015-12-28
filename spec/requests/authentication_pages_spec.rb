require 'rails_helper'
require 'spec_helper'

RSpec.describe "AuthenticationPages", type: :request do
  describe "GET /authentication_pages" do
    it "basicaly the login page exist." do
      get login_path 
      expect(response).to have_http_status(200)
      visit (login_path)
      expect(page).to have_content('Sign in')
    end
  end

  describe "with invalid information" do
    it "should have Signin page without authentication" do
      visit (login_path)
      expect(page).to have_content('Sing in') 
      visit (login_path)
      have_content('Invalid username/password combination')
    end

  end
end
