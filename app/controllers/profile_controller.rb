class ProfileController < ApplicationController
  def update
    if current_person.update_attributes params[:person]
      redirect_to profile_url, notice: 'Profile successfully updated.'
    else
      render :edit
    end
  end
end