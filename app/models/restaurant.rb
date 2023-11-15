class Restaurant < ApplicationRecord
# Un restaurant doit avoir un nom, une adresse et une catégorie.
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true

  # ["chinese", "italian", "japanese", "french", "belgian"].
  validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"] }
end
