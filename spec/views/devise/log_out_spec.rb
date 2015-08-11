RSpec.describe User, "log out" do
  feature "Log out" do
    let!(:user) {FactoryGirl.create :user}

    scenario "Log out" do
      visit "/users/sign_in"
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Login"
      
      click_link "Log Out"

      expect(page).to have_link "Log in"
    end
  end
end
