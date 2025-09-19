class CreateEnderecos < ActiveRecord::Migration[8.0]
  def change
    create_table :enderecos do |t|
      t.integer :cep
      t.string :logradouro
      t.integer :numero
      t.string :cidade

      t.timestamps
    end
  end
end
