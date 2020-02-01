require "rails_helper"

RSpec.feature "Editar Ticket" do
  before do
    @admin = create(:user)
    @techie = create(:user)
    @techie.role = 'tecnico'
    @client1 = create(:user)

    @ticket1 = Ticket.create(asunto: "New ticket", contenido: "NT contenido here", cliente_id: @client1.id, tecnico_id: @techie.id)
  end

  scenario "A 'client' user updates their ticket" do
    login_as @client1

    visit "/"

    click_link "Tickets"
    click_link @ticket1.id
    find(:css, "#edit-ticket").click

    fill_in "ticket_asunto", with: "Creating new ticket"
    select 'abierto', :from => 'ticket_status'
    fill_in "ticket_contenido", with: "Content for the new ticket - Updated"
    click_button "Guardar"

    expect(page).to have_content("El ticket se actualizó éxitosamente!")
    expect(page).to have_content("Creating new ticket")
    expect(page).to have_content("Content for the new ticket - Updated")
  end

  scenario "A 'tecnico' user updates 'client' ticket" do
    login_as @techie

    visit "/"

    click_link "Tickets"
    click_link @ticket1.id
    find(:css, "#edit-ticket").click

    fill_in "ticket_asunto", with: "Creating new ticket"
    select 'abierto', :from => 'ticket_status'
    fill_in "ticket_contenido", with: "Content for the new ticket - Updated"
    click_button "Guardar"

    expect(page).to have_content("El ticket se actualizó éxitosamente!")
    expect(page).to have_content("Creating new ticket")
    expect(page).to have_content("Content for the new ticket - Updated")
  end

  scenario "A 'admin' user updates 'client' ticket" do
    login_as @admin

    visit "/"

    click_link "Tickets"
    click_link @ticket1.id
    find(:css, "#edit-ticket").click

    fill_in "ticket_asunto", with: "Creating new ticket"
    select 'abierto', :from => 'ticket_status'
    fill_in "ticket_contenido", with: "Content for the new ticket - Updated"
    click_button "Guardar"

    expect(page).to have_content("El ticket se actualizó éxitosamente!")
    expect(page).to have_content("Creating new ticket")
    expect(page).to have_content("Content for the new ticket - Updated")
  end

end
