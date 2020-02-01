class CreateTicketMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :ticket_messages do |t|
      t.integer :user_id
      t.integer :ticket_id
      t.text :contenido

      t.timestamps
    end
  end
end
