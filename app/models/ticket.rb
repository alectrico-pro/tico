class Ticket < ApplicationRecord
  belongs_to :client, class_name: 'User'
  belongs_to :technician, class_name: 'User'

  has_many :ticket_messages

  enum status: {
    abierto: 0,
    atendiendo: 1,
    pendiente: 2,
    cerrado: 3
  }

  validates :subject, presence: true
  validates :content, presence: true

  scope :tickets_open, -> { where.not(status: :cerrado) }
  scope :tickets_closed, -> { where(status: :cerrado) }

end
