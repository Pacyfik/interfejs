#encoding: utf-8
class Tag < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :movies
  
  attr_accessible :name, :picture
  validates_presence_of :name, :picture
end
