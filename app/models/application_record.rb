class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def make_uid
    self.uid = SecureRandom.hex(10)
  end
end
