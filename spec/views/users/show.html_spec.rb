RSpec.describe User, "Show profile" do
  feature "Show user profile" do
    let!(:user1) {FactoryGirl.create :user}
    let!(:user2) {FactoryGirl.create :user}
    let!(:admin) {FactoryGirl.create :admin}

    before do
      visit "users/sign_in"      
      fill_in "Email", with: user1.email
      fill_in "Password", with: user1.password
      click_button "Login"
    end

    scenario "User want to show profile" do
      click_link "Profile"

      expect(page).to have_content user1.name
      expect(page).to have_content user1.email
      expect(page).to have_link "Edit profile"
    end

    scenario "User can see other user profile" do
      visit "/users/#{user2.id}"

      expect(page).to have_content user2.name 
      expect(page).to have_content user2.email
    end
  end
end
