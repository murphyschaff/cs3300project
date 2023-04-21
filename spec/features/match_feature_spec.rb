require "rails_helper"

RSpec.feature "Matches", type: :feature do
  context "Login" do
    scenario "should sign up" do
      visit root_path
      click_link 'Sign up'
      within("form") do
        fill_in "Email", with: "testing@test.com"
        fill_in "Password", with: "123456"
        fill_in "Password confirmation", with: "123456"
        click_button "Sign up"
      end
      expect(page).to have_content("Welcome! You have signed up successfully.")
    end


    scenario "should log in" do
      user = FactoryBot.create(:user)
      login_as(user)
      visit root_path
      expect(page).to have_content("Logged in")
    end
  end

    context "Update match" do
      let(:match) { Match.create(opponent: "dude", score: 12, location: "denver", notes: "hi") }
      before(:each) do
        user = FactoryBot.create(:user)
        login_as(user)
        visit edit_match_path(match)
      end
      
      #opponent
      scenario "change opponent should be successful" do
        within("form") do
          fill_in "Opponent", with: "New description content"
        end
        click_button "Update Match"
        expect(page).to have_content("Match was successfully updated")
      end
 
 
      scenario "should fail" do
        within("form") do
          fill_in "Opponent", with: ""
        end
        click_button "Update Match"
        expect(page).to have_content("Opponent can't be blank")
      end

      #score
      scenario "change location should be successful" do
        within("form") do
          fill_in "Score", with: 15
        end
        click_button "Update Match"
        expect(page).to have_content("Match was successfully updated")
      end
 
 
      scenario "should fail" do
        within("form") do
          fill_in "Score", with: ""
        end
        click_button "Update Match"
        expect(page).to have_content("Score can't be blank")
      end

      #Location
      scenario "change location should be successful" do
        within("form") do
          fill_in "Location", with: "New description content"
        end
        click_button "Update Match"
        expect(page).to have_content("Match was successfully updated")
      end
 
 
      scenario "should fail" do
        within("form") do
          fill_in "Location", with: ""
        end
        click_button "Update Match"
        expect(page).to have_content("Location can't be blank")
      end
    end

    context "Create Match" do
        before(:each) do
          user = FactoryBot.create(:user)
          login_as(user)
          visit new_match_path
        end

        scenario "Match was succesfully created" do
            within("form") do
              fill_in "Opponent", with: "dave"
              fill_in "Score", with: 12
              fill_in "Location", with: "denver"
              fill_in "Notes", with: "notes"
            end
            click_button "Create Match"
            expect(page).to have_content("Match was successfully created.")
          end
    
          scenario "Opponent cant be blank" do
            within("form") do
                fill_in "Score", with: 12
                fill_in "Location", with: "denver"
                fill_in "Notes", with: "notes"
            end
    
            click_button "Create Match"
            expect(page).to have_content("Opponent can't be blank")
          end
    
          scenario "Score cant be blank" do
            within("form") do
                fill_in "Opponent", with: "dave"
                fill_in "Location", with: "denver"
                fill_in "Notes", with: "notes"
            end
            click_button "Create Match"
            expect(page).to have_content("Score can't be blank")
          end

          scenario "Location cant be blank" do
            within("form") do
                fill_in "Opponent", with: "dave"
                fill_in "Score", with: 12
                fill_in "Notes", with: "notes"
            end
            click_button "Create Match"
            expect(page).to have_content("Location can't be blank")
        end
    
    end    
end
 


