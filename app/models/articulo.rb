class Articulo < ApplicationRecord
    validates :titulo, presence: true
    validates :cuerpo, presence: true
end