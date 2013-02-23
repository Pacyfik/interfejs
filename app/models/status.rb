#encoding: utf-8
class Status < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user
  has_and_belongs_to_many :tags
  
  attr_accessible :description, :seen, :movie_id, :user_id, :tag_ids
end
