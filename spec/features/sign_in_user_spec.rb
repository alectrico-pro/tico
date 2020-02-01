require "rails_helper"

RSpec.feature "Users sign-in" do
  before do
    @user = create(:user)
  end

  scenario "with valid credentials" do
    visit "/"

    click_link "Iniciar Sesión"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Iniciar Sesión"

    expect(page).to have_content("Ud ha abierto una sesión.")
  end
end
