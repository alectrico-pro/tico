require "rails_helper"

RSpec.feature "User sign out" do
  before do
    user = create(:user)
    visit "/"

    click_link "Iniciar Sesión"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Iniciar Sesión"
  end

  scenario "redirects to home" do
    visit "/"
    click_link "Cerrar Sesión"
    expect(page).to have_content("La sesión se ha cerrado.")
  end
end
