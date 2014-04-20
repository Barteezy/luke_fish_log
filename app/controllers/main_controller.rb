class MainController < ApplicationController
before_action :ensure_signed_out, only: [:login_get, :sign_up_get]
before_filter  do
  @logged_in_user = User.where(id: session[:logged_in_user_id]).first
    if @logged_in_user != nil && @logged_in_user.was_email_verified != true
      flash.now[:remind_to_verify_email] = true
    end
  end

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
  # @user.email_verification_token = rand(10 ** 8)
  if @user.save == true 
     session[:user_id] = @user.id
     flash[:success] = "Check your email to finish registration."
    # link = verify_email_url(@user.id, @user.email_verification_token)
    # Pony.mail(

    #  to: @user.email,
    #  subject: "Thanks for registering for Colorado Fish Log",
    #  body:      "Please click the following link to verify your email address: #{link}",
    #  html_body: "Please click <a href='#{link}'>here</a> to verify your email address."
    #  )
    redirect_to new_profile_path
  else
    render :sign_up
  end
end

# def verify_email
#     user = User.where(id: params[:user_id]).first
#     if user != nil
#       if user.email_verification_token == params[:token]
#         user.was_email_verified = true
#         user.save!
#         flash[:success] = "Email has been verified."
#         session[:logged_in_user_id] = user.id
#       else
#         flash[:error] = "Wrong email verification token"
#       end
#       redirect_to new_profile_path and return
#     else
#       flash[:error] = "Couldn't find user with that ID"
#     end
#   end

# def resend_verification_email
#     Pony.mail(
#       to:      @logged_in_user.email,
#       subject: "Thanks for registering",
#       body:    "Please click the following link to verify your email address:
# #{verify_email_url(@logged_in_user.id, @logged_in_user.email_verification_token)}"
#     )
#     flash[:success] = "Verification email sent."
#     redirect_to params[:afterwards_go_to]
#   end


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
  elsif current_user.profile == nil
    redirct_to new_profile_path
  else
    session[:user_id] = @user.id
    redirect_to "/profiles/#{current_user.id}"
  end
end

  private 

  def ensure_signed_out
    if signed_in?
      redirect_to current_user.profile
    end

end
end


