class DeetsController < ApplicationController
  skip_filter :require_login

  def show
    deet = {
      name: 'unknown',
      email: 'unknown',
      birth: 0,
      links: {}
    }
    person = Person.find_by_slug params[:id]
    deet = person.attributes if person
    render json: deet
  end
end