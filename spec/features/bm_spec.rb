feature 'application setup' do
  feature 'root path' do
    scenario 'is sucessfull' do
      visit '/'
      expect(page.status_code).to be 200
    end

    scenario 'it has bookmark manager' do
      visit '/'
      expect(page).to have_content 'Bookmark Manager'
    end
    scenario 'it has add link' do
      visit '/'
      expect(page).to have_content 'Add Link'
    end
    scenario 'it has sign up' do
      visit '/'
      expect(page).to have_content 'Sign Up'
    end
    scenario 'it has sign in' do
      visit '/'
      expect(page).to have_content 'Sign In'
    end
    scenario 'bookmarks has a url' do
      visit '/'
      expect(page).to have_content 'Url'
    end
    scenario 'bookmarks has a description' do
      visit '/'
      expect(page).to have_content 'Description'
    end
    scenario 'bookmarks displays posted by' do
      visit '/'
      expect(page).to have_content 'Created:'
    end

  end
end
