class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to profiles_path, notice: "Logged in!"
    else
      flash[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out."

  end

  private

  def params_email
    params.require(:user).permit(:email)
  end

  def params_password
    params.require(:user).permit(:password)
  end
end
