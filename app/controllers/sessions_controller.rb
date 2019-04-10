class SessionsController < ApplicationController
  def create
    @user = User.find_by(:email => auth['info']['email'])

    if !@user || !@user.id
      @user = User.create({
        :email => auth['info']['email'],
        :password => "123123123",
        :password_confirmation => "123123123",
        :created_at => Time.new,
        :updated_at => Time.new
      })
    end

    sign_in_and_redirect(:user, @user)
  end
 
  private
 
  def auth
    request.env['omniauth.auth']
  end
end