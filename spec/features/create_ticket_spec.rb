require "rails_helper"

RSpec.feature "Create Ticket" do
  before do
    login_as create(:user), scope: :user
    @techie = User.create!(email: "tech@example.com", password: "password", password_confirmation: "password", role: "tecnico")
  end

  scenario "A user creates a new ticket" do
    visit "/"

    click_link "+ Ticket"

    fill_in "ticket_subject", with: "Creating new ticket"
    select 'abierto', :from => 'ticket_status'
    fill_in "ticket_content", with: "Content for the new ticket"
    click_button "Guardar"

    expect(page).to have_content("El ticket fue éxitosamente creado!")
    expect(page).to have_content("Creating new ticket")
    expect(page).to have_content("Content for the new ticket")
  end
end
