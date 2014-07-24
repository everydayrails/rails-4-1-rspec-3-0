require 'rails_helper'

feature "About BigCo modal" do
  scenario "toggles display of the modal about display", js: true do
    visit root_path

    expect(page).to_not have_content 'About BigCo'
    expect(page).to_not \
      have_content 'BigCo produces the finest widgets in all the land'

    click_link 'About Us'

    expect(page).to have_content 'About BigCo'
    expect(page).to \
      have_content 'BigCo produces the finest widgets in all the land'

    within '#about_us' do
      click_button 'Close'
    end

    expect(page).to_not have_content 'About BigCo'
    expect(page).to_not \
      have_content 'BigCo produces the finest widgets in all the land'
  end
end
