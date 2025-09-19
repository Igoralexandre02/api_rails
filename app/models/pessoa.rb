class Pessoa < ApplicationRecord
  belongs_to :endereco, optional: true
  accepts_nested_attributes_for :endereco
end
