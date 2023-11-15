class Review < ApplicationRecord
belongs_to :restaurant
  # Un avis doit avoir un contenu.
  # Un avis doit avoir une note.
  validates :content, presence: true
  validates :rating, presence: true

  # La note d’un avis doit être un nombre entre 0 et 5.
  validates :rating,  numericality: { only_integer: true }

  # La note d’un avis doit être un entier. Par exemple, un avis avec une note de 2,5 doit être invalide !
  validates :rating, inclusion: { in: (0..5) }

  # Quand un restaurant est supprimé, tous ses avis doivent aussi être supprimés.
  # Un avis doit appartenir à un restaurant.

end
