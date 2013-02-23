#encoding: utf-8
class Tag < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :statuses
  
  attr_accessible :name, :picture, :user_id, :status_ids
  validates_presence_of :name, :picture
end
