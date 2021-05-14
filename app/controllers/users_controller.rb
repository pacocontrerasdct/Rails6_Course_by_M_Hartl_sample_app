class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    # debugger
  end

  def new
    # debugger
    @user = User.new
  end
  
  def create
    # debugger
    @user = User.new(user_params)
    
    if @user.save
      # Handle successful request
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end
  
  private
  
    def user_params
      params.required(:user).permit(:name, :email, :password,
                                    :password_confirmation)
    end
end
