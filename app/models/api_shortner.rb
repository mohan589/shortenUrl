class ApiShortner < ApplicationRecord
  after_create :generate_slug

  validates :input_url, :presence => true

  # generate the new unique slug and updates in the api shortner table
  def generate_slug
    self.slug = self.id.to_s(36)
    self.save
  end
end
