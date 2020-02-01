require "rails_helper"

RSpec.feature "Show Tickets List" do
  before do
    @admin = create(:user)
    @techie =  create(:user)
    @techie.role = 'tecnico'
    @client1 = create(:user)
    @client1.role = 'cliente'
    @client2 = create(:user)
    @client2.role = 'cliente'
    @ticket1 = Ticket.create(asunto: "New ticket", contenido: "NT contenido here", cliente_id: @client1.id, tecnico_id: @techie.id)
    @ticket2 = Ticket.create(asunto: "U2 New ticket", contenido: "U2 NT contenido here", cliente_id: @client2.id, tecnico_id: @techie.id)
  end

  scenario "client can only see their tickets" do
    login_as @client1

    visit "/"

    click_link "Tickets"

    expect(page).to have_link(@ticket1.id)
    expect(page).to_not have_link(@ticket2.id)
  end

  scenario "tecnico can see all tickets" do
    login_as @techie

    visit "/"

    click_link "Tickets"

    expect(page).to have_link(@ticket1.id)
    expect(page).to have_link(@ticket2.id)
  end


    scenario "admin can see all tickets" do
      login_as @admin

      visit "/"

      click_link "Tickets"

      expect(page).to have_link(@ticket1.id)
      expect(page).to have_link(@ticket2.id)
    end

end
