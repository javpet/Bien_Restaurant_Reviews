class SessionsController < ApplicationController

  def new
    #login form
  end

  def create
    #actually try to login
    @form_data = params.require(:session) # This is coming from the from

    # pull out the username and password from form data, form_data is a hash
    @username = @form_data[:username]
    @password = @form_data[:password]

    # let's check the user, if they are --- syntax coming from has_secure_password documentation
    @user = User.find_by(username: @username).try(:authenticate, @password)

    # if there is the user present
    if @user
      # Store the user as we move around the website, save it to the user's session (the session is a hash)
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render "new"
    end
  end

  def destroy
    #logging out
    reset_session # this is built in to rails to reset the session, everything attached is cleared out
    redirect_to new_session_path
  end
end
