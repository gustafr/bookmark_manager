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

  feature 'add link' do

     background {visit '/'}

    #lägg till before-block som adderar länk till databasen.
    scenario 'add link path works' do
      visit '/add_link'
      expect(page.status_code).to eq 200
    end

    scenario 'add link path renders a form' do
      visit '/add_link'
      expect(page).to have_selector "form[action='/new_link']"
      #Why doesn't the syntax below work?
      #expect(page).to have_selector "form[method='POST']"
      #expect(page).to have_selector "form[type='text']"
      #expect(page).to have_selector "form[name='title']"
      #expect(page).to have_selector "form[name='description']"
      #expect(page).to have_selector "form[name='url']"
    end

    scenario 'adds a link' do
      expect(Link.count).to eq 0
      visit '/add_link'
      fill_in 'title', :with => 'Testpage'
      fill_in 'description', :with => 'Testdescription'
      fill_in 'url', :with => 'www.test.com'
      click_on 'submit'
      expect(Link.count).to eq 1
      expect(page.current_path).to eq '/new_link'
    end
  end

  feature 'sign up' do
    before {visit '/'}

    scenario 'click on button sign up route to /sign_up page' do
      click_on 'Sign Up'
      expect(page.current_path).to eq '/sign_up'
      expect(page.status_code).to eq 200
    end

    scenario 'displays a user /sign_up form' do
      visit '/sign_up'
      expect(page).to have_selector "form[action='/dashboard']"
      # expect(page).to have_selector "input[type='text']"
      # expect(page).to have_selector "input[name='username']"
      # expect(page).to have_selector "input[type='text']"
      # expect(page).to have_selector "input[name='email']"
      # expect(page).to have_selector "input[type='text']"
      # expect(page).to have_selector "input[name='password']"
      # expect(page).to have_selector "input[type='submit']"
      # expect(page).to have_selector "input[vaule='Sign Up']"
    end
  end
end
