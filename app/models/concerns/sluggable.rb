module Sluggable extend ActiveSupport::Concern
  included do
    acts_as_url :name, url_attribute: :slug
  end
  def to_param
    "#{id}-#{slug}"
  end
end