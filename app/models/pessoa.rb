class Pessoa < ApplicationRecord
  belongs_to :endereco, optional: true
  validates_associated :endereco
  accepts_nested_attributes_for :endereco

  validates :nome, :cpf, :email, :telefone, presence: true
  validates :cpf, uniqueness: true
  validates :cpf, length: { is: 11 }
  validates :cpf, format: { with: /\A\d+\z/ }
  validates :telefone, format: { with: /\A\d+\z/ }
end
