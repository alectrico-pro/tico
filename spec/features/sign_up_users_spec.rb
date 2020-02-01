require "rails_helper"

RSpec.feature "Users signup" do
  scenario "with valid credentials" do
    visit "/"

    click_link "Crear Cuenta"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in :user_password_confirmation, with: "password"
    click_button "Crear Cuenta"

    expect(page).to have_content("Se ha registrado éxitosamente en Tico.")
  end
end
