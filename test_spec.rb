browser = Capybara.current_session

describe "Test Task" do
  context "UI Tests for WebForm" do
    it "Login with correct credentials" do # пока еще точно не понял , как и что нужно называть
      browser.visit 'https://the-internet.herokuapp.com/login'
      browser.fill_in 'Username', with: 'tomsmith'
      browser.fill_in 'Password', with: 'SuperSecretPassword!'
      browser.click_on 'Login'
      unless browser.html.include? "You logged into a secure area!"
        fail
      end
    end

    it "Login with incorrect username" do
      browser.visit 'https://the-internet.herokuapp.com/login'
      browser.fill_in 'Username', with: 'Jonh'
      browser.fill_in 'Password', with: '123123'
      browser.click_on 'Login'
      unless browser.html.include? "Your username is invalid!"
        fail
      end
    end

    it "Login with incorrect pass" do
      browser.visit 'https://the-internet.herokuapp.com/login'
      browser.fill_in 'Username', with: 'tomsmith'
      browser.fill_in 'Password', with: 'incorrectpass'
      browser.click_on 'Login'
      unless browser.html.include? "Your password is invalid!"
        fail
      end
    end


    it "Check 'Login button' and take screenshot" do
      browser.visit 'https://the-internet.herokuapp.com/login'
      browser.save_screenshot(Dir.getwd + '/scr.png') # Screenshot will saved into project directory
      unless browser.has_button? "Login"
        fail
      end
    end


    it "Log out" do
      browser.visit 'https://the-internet.herokuapp.com/login'
      browser.fill_in 'Username', with: 'tomsmith'
      browser.fill_in 'Password', with: 'SuperSecretPassword!'
      browser.click_on 'Login'
      browser.click_on 'Logout'
      unless browser.html.include? "You logged out of the secure area!"
        fail
      end
    end
  end
end

