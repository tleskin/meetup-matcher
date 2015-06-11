class SessionsController < ApplicationController
  skip_before_action :authorize!

  def create
    user = User.find_or_create_from_auth(auth)
    if user
      session[:user_id] = user.id
      TweetWordExtractorWorker.perform_async(
        user.id, 
        session[:lat], 
        session[:lon] 
      )
      redirect_to meetup_index_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
