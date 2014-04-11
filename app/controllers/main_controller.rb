class MainController < ApplicationController

def root
	@user = User.find_by(id: session[:user_id])
	render :index and return
end

def login_get
  @user = User.find_by(id: session[:user_id])
  render :login and return
end

def sign_up_get
  @user = User.find_by(id: session[:user_id])
  render :sign_up and return
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
      redirect_to new_profile_path and return
    else
      render :sign_up and return
    end
end

def fish_id_get
  @user = User.find_by(id: session[:user_id])
  render :fish_id
end

def about
  @user = User.find_by(id: session[:user_id])
end

def logout
    session.clear
  redirect_to "/logged_out" and return
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
    render :login and return
  elsif @user.authenticate(password) == false
    flash[:error2] = "Password does not match"
    @old_email = email
    render :login and return
  else
    session[:user_id] = @user.id
    redirect_to "/profiles/#{@user.id}" and return
  end
end


end


