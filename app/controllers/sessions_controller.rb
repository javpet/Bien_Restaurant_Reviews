class SessionsController < ApplicationController

  def new
    #login form
  end

  def create
    #actually try to login
    @form_data = params.require(:session)

    # pull out the username and password from form data, form_data is a hash
    @username = @form_data[:username]
    @password = @form_data[:password]

    # let's check the user, if they are --- syntax coming from has_secure_password
    @user = User.find_by(username: @username).try(:authenticate, @password)

    # if there is the user present
    if @user
      redirect_to root_path
    else
      render "new"
    end
  end

  def destroy
    #logging out
  end
end
