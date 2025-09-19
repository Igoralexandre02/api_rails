class CreatePessoas < ActiveRecord::Migration[8.0]
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.string :cpf
      t.string :email
      t.string :telefone
      t.references :endereco, null: false, foreign_key: true

      t.timestamps
    end
  end
end
