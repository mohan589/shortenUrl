class ApiShortner < ApplicationRecord
  after_create :generate_slug

  def generate_slug
    self.slug = self.id.to_s(36)
    self.save
  end

  def display_slug
     self.slug
  end
end
