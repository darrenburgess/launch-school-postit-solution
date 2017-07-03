module Sluggable
  extend ActiveSupport::Concern

  included do
    before_save :generate_slug
  end

  def generate_slug
    if self.class.name == "Post"
      self.slug = create_slug(title)
    elsif self.class.name == "User"
      self.slug = create_slug(username)
    elsif self.class.name == "Category"
      self.slug = create_slug(name)
    end
  end

  def create_slug(str)
    str.strip.gsub(/\W/, "-")
             .gsub(/-{2,}/, "-")
             .gsub(/ {2,}/, " ")
             .gsub(/^-|-$/, "")
  end

  def to_param
    self.slug
  end
end
