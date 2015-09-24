feature 'application setup' do
  feature 'root path' do
    scenario 'is sucessfull' do
      visit '/'
      expect(page.status_code).to be 200
    end

    scenario 'it has bookmark manager button' do
      visit '/'
      expect(page).to have_content 'Bookmark Manager'
    end
    scenario 'it has add link button' do
      visit '/'
      expect(page).to have_content 'Add Link'
    end
    scenario 'it has sign up button' do
      visit '/'
      expect(page).to have_content 'Sign Up'
    end
    scenario 'it has a sign in button' do
      visit '/'
      expect(page).to have_content 'Sign In'
    end
  end
end
