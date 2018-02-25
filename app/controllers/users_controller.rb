class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
      @user = User.find_by(username: params[:id])
  end



  def new
    # a form for adding a new user
    @user = User.new
  end

  def create
    @user = User.new(form_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path
    else
      render "new"
    end
  end

  def form_params
    params.require(:user).permit(:username, :email, :password, :password_digest )
  end

end
