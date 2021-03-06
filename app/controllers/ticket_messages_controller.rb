class TicketMessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_message, only: [:new, :create, :edit, :update]
  # load_and_authorize_resource

  def new
    @ticket_message = TicketMessage.new
  end

  def create
    @ticket_message = @ticket.ticket_messages.new(message_params)
    @ticket_message.user = current_user
    if @ticket_message.save
      redirect_back(fallback_location: (request.referer || root_path),
                    notice: "Su mensaje fue guardado!")
    else
      redirect_back(fallback_location: (request.referer || root_path),
                    notice: "Su mensaje no pudo ser guardado!")
    end
  end

  def edit
    @ticket_message = @ticket.ticket_messages.find_by_id(params[:id])
  end

  def update
    @ticket_message = @ticket.ticket_messages.find_by_id(params[:id])
    if @ticket_message.update(message_params)
      redirect_back(fallback_location: (request.referer || root_path),
                    notice: "Su mensaje fue guardado!")
    else
      redirect_back(fallback_location: (request.referer || root_path),
                    notice: "Su mensaje no pudo ser guardado!")
    end
  end

  private
    def message_params
      params.require(:ticket_message).permit(:user_id, :ticket_id, :contenido)
    end

    def find_message
      @ticket = Ticket.find_by_id(params[:ticket_id]) if params[:ticket_id]
    end
end
