class DeetsController < ApplicationController
  def show
    deet = test
    deet = me if params[:id] == '2a063c90388fce5fe65f6564287bb6a2'
    render json: deet
  end

private

  def test
    {
      name: 'Unknown',
      email: 'test@test.com',
      birth: 0,
      links: {
        twitter: 'http://twitter.com/test'
      }
    }
  end

  def me
    {
      name: 'Mark Ryall',
      email: 'mark@ryall.name',
      birth: -25381800000,
      links: {
        home: 'http://mark.ryall.name',
        skype: 'skype:mark_ryall',
        phone: 'tel:+61414740489',
        twitter: 'http://twitter.com/markryall',
        facebook: 'http://facebook.com/mark.ryall',
        github: 'http://github.com/markryall',
        bitbucket: 'https://bitbucket.org/markryall',
        coderwall: 'https://coderwall.com/markryall',
        linkedin: 'http://linkedin.com/in/markryall',
        flickr: 'http://flickr.com/photos/markryall',
        aboutme: 'http://about.me/markryall',
        lastfm: 'http://last.fm/user/mryall',
        goodreads: 'http://www.goodreads.com/user/show/1908681'
      }
    }
  end
end