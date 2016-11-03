class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(user_params)
    if user
      session[:user_id] = user.id
      redirect_to restaurants_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
  private
  def user_params
    params.require(:session).permit(:email, :password)
  end
end
