require "rails_helper"

RSpec.feature "Close Ticket" do
  before do
    @admin = create(:user)
    @techie = create(:user)
    @techie.role = 'tecnico'
    @client1 = create(:user)

    @ticket1 = Ticket.create(asunto: "New ticket", contenido: "NT contenido here", cliente_id: @client1.id, tecnico_id: @techie.id)
  end

  scenario "A 'client' user closes their ticket" do
    login_as @client1

    visit "/"

    click_link "Tickets"
    click_link @ticket1.id
    find(:css, "#edit-ticket").click

    select 'cerrado', :from => 'ticket_status'
    click_button "Guardar"

    expect(page).to have_content("El ticket se actualizó éxitosamente!")
    expect(page).to_not have_link @ticket1.id
  end

  scenario "A 'tecnico' user closes 'client' ticket" do
    login_as @techie

    visit "/"

    click_link "Tickets"
    click_link @ticket1.id
    find(:css, "#edit-ticket").click

    select 'cerrado', :from => 'ticket_status'
    click_button "Guardar"

    expect(page).to have_content("El ticket se actualizó éxitosamente!")
    expect(page).to_not have_link @ticket1.id
  end

  scenario "A 'admin' user closes 'client' ticket" do
    login_as @admin

    visit "/"

    click_link "Tickets"
    click_link @ticket1.id
    find(:css, "#edit-ticket").click

    select 'cerrado', :from => 'ticket_status'
    click_button "Guardar"

    expect(page).to have_content("El ticket se actualizó éxitosamente!")
    expect(page).to_not have_link @ticket1.id
  end

end
