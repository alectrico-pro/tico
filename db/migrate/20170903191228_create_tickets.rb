class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string  :asunto
      t.text    :contenido
      t.integer :status, default: 0
      t.integer :cliente_id
      t.integer :tecnico_id
      t.integer :colaborador_id
      t.timestamps
    end
  end
end
