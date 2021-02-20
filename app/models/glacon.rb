require "securerandom"
require "babosa"
require "base64"

class Glacon < ApplicationRecord
  before_create do
    self.uuid = SecureRandom.hex(4)
    self.slug = self.name.to_slug.normalize.to_s

    self.header = Base64.encode64(open(self.header).read)
    self.thumbnail = Base64.encode64(open(self.thumbnail).read)

  end
end
