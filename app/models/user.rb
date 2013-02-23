#encoding: utf-8
class User < ActiveRecord::Base
  has_many :statuses
  has_many :tags

  attr_accessible :crypted_password, :email, :login, :persistence_token
  attr_protected :admin
  
  acts_as_authentic do |config|
	config.crypted_password_field = :crypted_password
	config.require_password_confirmation = true
  end
  
  validates :email, :presence => true, :format => { :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/, :message => "Wpisz poprawny adres e-mail." }
  validates :crypted_password, :presence => true, :length => { :minimum => 5, :message => "Hasło musi składać się przynajmniej z 5 znaków."}
  validates :login, :presence => true, :uniqueness => true
end
