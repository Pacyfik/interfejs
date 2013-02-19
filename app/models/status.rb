#encoding: utf-8
class Status < ActiveRecord::Base
  belongs_to :user
  has_one :movie
  
  attr_accessible :description, :seen
  validates_presence_of :seen
end
