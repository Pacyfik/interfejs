#encoding: utf-8
class Movie < ActiveRecord::Base
  has_many :statuses
  
  attr_accessible :country, :genre, :id2, :overview, :poster_path, :title, :year
  validates_presence_of :id2, :title, :year
end
