require "securerandom"
require "babosa"

class Glacon < ApplicationRecord
  before_create do
    self.uuid = SecureRandom.hex(4)
    self.slug = self.name.to_slug.normalize.to_s
  end
end
