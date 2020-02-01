class Ticket < ApplicationRecord
  belongs_to :cliente, class_name: 'User'
  belongs_to :tecnico, class_name: 'User'
#  belongs_to :colaborador, class_name: 'User', :optional => true

  has_many :ticket_messages

  enum status: {
    abierto: 0,
    atendiendo: 1,
    pendiente: 2,
    cerrado: 3
  }

  validates :asunto, presence: true
  validates :contenido, presence: true

  scope :tickets_abierto, -> { where.not(status: :cerrado) }
  scope :tickets_cerrado, -> { where(status: :cerrado) }

end
