class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by(email: auth['info']['email']) do |u|
      # u.name = auth['info']['name']
    end
 
    session[:user_id] = @user.id
 
    render 'meals/index'
  end
 
  private
 
  def auth
    request.env['omniauth.auth']
  end
end