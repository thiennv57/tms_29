RSpec.describe User, "Show home page" do
  feature "Show home page" do
    let!(:user1) {FactoryGirl.create :user}
    let!(:user2) {FactoryGirl.create :user}

    before do
      visit "users/sign_in"      
      fill_in "Email", with: user1.email
      fill_in "Password", with: user1.password
      click_button "Login"
    end

    scenario "User can see home page when loggedin" do
      visit "/"

      expect(page).to have_content "Welcome to Framgia Training System"
      expect(page).to have_content user1.name
    end
  end

  feature "Admin show dashboard" do
    let!(:admin) {FactoryGirl.create :admin}

    before do
      visit "users/sign_in"      
      fill_in "Email", with: admin.email
      fill_in "Password", with: admin.password
      click_button "Login"
    end

    scenario "User can see home page when logged in" do
      expect(page).to have_content "Signed in successfully."
      expect(page).to have_content "Admin | Dashboard"
      expect(page).to have_content "Users"
      expect(page).to have_content User.count
      expect(page).to have_content "Courses"
      expect(page).to have_content Course.count
      expect(page).to have_content "Subjects"
      expect(page).to have_content Subject.count
    end
  end
end
