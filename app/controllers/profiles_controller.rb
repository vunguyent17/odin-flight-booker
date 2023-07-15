# frozen_string_literal: true

class ProfilesController < ApplicationController  
  def show
    @profile = User.find_by(username: current_user.username) or not_found if user_signed_in?
  end

  private
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end