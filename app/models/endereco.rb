class Endereco < ApplicationRecord
  validates :cep, :logradouro, :numero, :cidade, presence: true
  validates :cep, :numero, uniqueness: true
  validates :cep, format: { with: /\A\d+\z/ }
  validates :numero, format: { with: /\A\d+\z/ }
end
