#encoding: utf-8
class Movie < ActiveRecord::Base
  has_and_belongs_to_many :statuses
  has_and_belongs_to_many :tags
  
  attr_accessible :country, :genre, :id2, :overview, :poster_path, :title, :year
  validates_presence_of :id2, :title, :year
end
