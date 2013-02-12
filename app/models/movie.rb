class Movie < ActiveRecord::Base
  attr_accessible :country, :genre, :id2, :overview, :poster_path, :title, :year
end
