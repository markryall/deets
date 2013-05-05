class Person < ActiveRecord::Base
  serialize :links, ActiveRecord::Coders::Hstore

  attr_accessible :birth, :email, :lastfm, :links, :name
end
