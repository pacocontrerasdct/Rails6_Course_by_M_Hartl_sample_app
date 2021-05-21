class SessionsController < ApplicationController
  
  def new
  end  
  
  def create
    user = User.find_by('email': params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      # Reset session to avoid 'session fixation' attack
      reset_session
      # log user in and redirect to user's show page
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    # Add log out method to Sessions Helper
    # in order to delete session and @user
    log_out
    redirect_to root_url
  end
end
