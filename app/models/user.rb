class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :name
  validates_presence_of :email
  validates_length_of :password, :minimum => 5, :maximum => 20, :allow_nil => true
  validates_uniqueness_of :email, :case_sensitive => false
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  before_validation :strip_whitespace, :only => [:name, :email, :password]

private
def strip_whitespace
  self.name = self.name.strip unless self.name.nil?
  self.email = self.email.strip.downcase unless self.email.nil?
  self.password = self.password.strip unless self.password.nil?
end

end
