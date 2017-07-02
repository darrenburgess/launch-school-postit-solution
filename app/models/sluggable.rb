module Sluggable
  extend ActiveSupport::Concern

  included do
    after_validation :create_slug
  end

  def create_slug
    self.slug = self.title.gsub(" ", "-")
  end

  def to_param
    self.slug
  end
end
