class MainController < ApplicationController

def root
	render :index
end

def login_get
  render :login
end

def sign_up_get
  render :sign_up
end

def sign_up_post
  @user = User.new
  username = params[:username]
  @user.username = params[:username]
  @user.email    = params[:email]
  @user.password = params[:password]
  @user.password_confirmation = params[:password_confirmation]
  if @user.save == true 
    session[:user_id] = @user.id
    redirect_to new_profile_path
  else
    render :sign_up
  end
end

def fish_id_get
  render :fish_id
end

def about
end

def logout
  session.clear
  redirect_to "/logged_out"
end

def logged_out_get
  render :success
end

def login_post
  email = params[:email]
  password = params[:password]
  @user = User.find_by(email: email)

  if @user == nil
    flash[:error] = "Email Not Found"
    @old_email = email
    render :login
  elsif @user.authenticate(password) == false
    flash[:error2] = "Password does not match"
    @old_email = email
    render :login
  else
    session[:user_id] = @user.id
    redirect_to "/profiles/#{current_user.id}"
  end
end


end


