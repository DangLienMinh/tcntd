module Sluggable extend ActiveSupport::Concern
  included do
    acts_as_url :name, :sync_url => true, url_attribute: :url
  end
  def to_param
    "#{id}-#{url}"
  end
end