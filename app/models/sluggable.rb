module Sluggable
  extend ActiveSupport::Concern

  included do
    after_validation :create_slug
  end

  def create_slug
    if self.class.name == "Post"
      self.slug = self.title.gsub(" ", "-")
    elsif self.class.name == "User"
      self.slug = self.username.gsub(" ", "-")
    elsif self.class.name == "Category"
      self.slug = self.name.gsub(" ", "-")
    end
  end

  def to_param
    self.slug
  end
end
