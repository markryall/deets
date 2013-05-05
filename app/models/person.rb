require 'digest/md5'

class Person < ActiveRecord::Base
  serialize :links, ActiveRecord::Coders::Hstore

  attr_accessible :birth, :email, :lastfm, :links, :name, :slug

  def self.create_for_email email
    Person.create email: email,
      slug: Digest::MD5.hexdigest(email),
      name: email.split("@")[0]
  end
end
