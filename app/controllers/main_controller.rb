class MainController < ApplicationController

def root
	render :index and return
end

def login_get
  render :login and return
end

def sign_up_get
  render :sign_up and return
end

def sign_up_post
    username = params[:username]
    current_user.username = params[:username]
    current_user.email    = params[:email]
    current_user.password = params[:password]
    current_user.password_confirmation = params[:password_confirmation]
    if current_user.save == true 
    session[:user_id] = current_user.id
      redirect_to new_profile_path and return
    else
      render :sign_up and return
    end
end

def fish_id_get
  render :fish_id
end

def about
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
  if current_user == nil
    flash[:error] = "Email Not Found"
    @old_email = email
    render :login and return
  elsif current_user.authenticate(password) == false
    flash[:error2] = "Password does not match"
    @old_email = email
    render :login and return
  else
    session[:user_id] = current_user.id
    redirect_to "/profiles/#{current_user.id}" and return
  end
end


end


