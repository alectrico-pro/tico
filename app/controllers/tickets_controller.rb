class TicketsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]


  def index
    if current_user.admin?
      @tickets = Ticket.all 
    elsif current_user.cliente?
      #@tickets = current_user.tickets
      @tickets = current_user.tickets
    end
  end

  def new
    @ticket = Ticket.new
  end

  def show
    @ticket_messages = @ticket.ticket_messages.order(created_at: :desc)
  end

  def closed
    @tickets = @tickets.tickets_cerrado
  end

  def create
    @ticket.cliente = current_user
    @ticket.tecnico = User.get_tecnico[0] #Escoge al primer técnico para la tarea
    if @ticket.save
      flash[:notice] = "El ticket fue éxitosamente creado!"
      redirect_to @ticket
    else
      flash[:alert] = "No se pudo crear el ticket! #{@ticket.errors.messages}"
      render :new
    end
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      flash[:notice] = "El ticket se actualizó éxitosamente!"
      redirect_to @ticket
    else
      flash[:alert] = "No se pudo actualizar el ticket!"
      render :edit
    end
  end

  def destroy
    # Admin should only be the ones allowed to delete a ticket
    @ticket.destroy
    redirect_to root_path
  end

  private
    def ticket_params
      params.require(:ticket).permit(:subject, :status, :content, :cliente_id, :tecnico_id, :colaborador_id)
    end

    def set_ticket
      @ticket = Ticket.find(params[:id])
    end
end
