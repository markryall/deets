class ProfileController < ApplicationController
  def update
    if current_person.update_attributes params[:person]
      redirect_to profile_url, notice: 'Profile successfully updated.'
    else
      render :edit
    end
  end

  def add_link
    current_person.links[params[:new_key]] = params[:new_url]
    current_person.save
    render json: {}
  end

  def remove_link
    current_person.links.delete params[:key]
    current_person.save
    render json: {}
  end
end