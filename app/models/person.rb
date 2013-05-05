class Person < ActiveRecord::Base
  attr_accessible :birth, :email, :lastfm, :links, :name
end
