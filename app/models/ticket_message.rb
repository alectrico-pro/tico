class TicketMessage < ApplicationRecord
  belongs_to :user
  belongs_to :ticket

  validates :contenido, presence: true
end
