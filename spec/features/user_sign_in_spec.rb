feature 'user sign in' do

    before {visit '/'}

    scenario 'click on button sign in route to /sign_in page' do
      click_on 'Sign In'
      expect(page.current_path).to eq '/sign_in'
      expect(page.status_code).to eq 200
    end

    scenario 'displays a user /sign_in form' do
      visit '/sign_in'
      expect(page).to have_selector "form[action='/sign_in']"
      expect(page).to have_selector "input[type='text']"
      expect(page).to have_selector "input[name='email']"
      expect(page).to have_selector "input[name='password']"
      expect(page).to have_selector "input[type='submit']"
      #expect(page).to have_selector "input[vaule='submit']"
      expect(page).to have_button "Sign in"
    end

    scenario 'user can sign in' do

      visit '/sign_in'
      User.create(email: 'email', password: 'password', password_confirmation: 'password')
      fill_in 'email', :with => 'email'
      fill_in 'password', :with => 'password'
      click_button 'Sign in'
      expect(page.current_path).to eq '/dashboard'
      expect(page.status_code).to eq 200
    end

    scenario 'user cant sign in if password doesnt match' do
      User.create(email: 'email', password: 'password', password_confirmation: 'password')
      visit '/sign_in'
      fill_in 'email', :with => 'email'
      fill_in 'password', :with => 'password_wrong'
      click_button 'Sign in'
      expect(page.current_path).to eq '/sign_in'
    end

    xscenario 'logged in user has a sign out button' do
      User.create(email: 'email', password: 'password', password_confirmation: 'password')
      expect(page).to have_content 'Sign Out'
    end

    xscenario 'logged in user can sign out' do
      User.create(email: 'email', password: 'password', password_confirmation: 'password')
      click_button 'Sign Out'
      expect(page).to not_have_content 'Sign Out'
    end

end