class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  has_many :favorites
  
  def like(micropost)
    self.favorites.find_or_create_by(micropost_id: micropost.id)
  end

  def unlike(micropost)
    relationship = self.favorites.find_by(micropost_id: micropost.id)
    relationship.destroy if relationship
  end

end
