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
	@user = User.new
	render :sign_up and return
end

def create_profile_get
	@user = User.find_by(id: session[:user_id])
	name = params[:name]
	@fish_type = FishType.find_by(name: name)
	render :create_profile and return
end

def create_profile_post
	 @user = User.find_by(id: session[:user_id])
  @profile = Profile.new(profile_params)
  @profile.user_id = @user.id
  @profile.location = params[:location]
  @profile.birth_year = params[:birth_year]
  @profile.favorite_target = params[:favorite_target]
  @profile.best_catch = params[:best_catch]
  @profile.short_bio = params[:short_bio]
  @profile.save!
  	redirect_to "/profile/#{@user.username}" and return

end

def edit_profile_post
   @user = User.find_by(id: session[:user_id])
   @profile = Profile.find_by(user_id: @user.id)
if @profile.update(profile_params)
            redirect_to "/profile/#{@user.username}"
      else 
    render :edit_profile and return
        
end


end

def edit_profile_get
	@user = User.find_by(id: session[:user_id])
	@profile = Profile.find_by(user_id: @user.id)
	 render :edit_profile and return
end



def add_fish_get
	@user = User.find_by(id: session[:user_id])
	 render :new and return
end

def add_fish_post
	 @user = User.find_by(id: session[:user_id])
  @fish_pin = FishPin.new
  @fish_pin.user_id = @user.id
  @fish_pin.location = params[:location]
  @fish_pin.species = params[:species]
  @fish_pin.length = params[:length]
  @fish_pin.weight = params[:weight]
  @fish_pin.bait = params[:bait]
  @fish_pin.depth = params[:depth]
  @fish_pin.temperature = params[:temperature]
  @fish_pin.other_notes = params[:other_notes]
  @fish_pin.save!
    redirect_to "/bragging_board" and return
end

def bragging_board_get
	@user = User.find_by(id: session[:user_id])
	render :bragging_board and return
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
  	redirect_to "/profile/#{@user.username}" and return
  end
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
      redirect_to "/create_profile/#{@user.username}" and return
    else
      render :sign_up and return
		end
end

def profile_get
	@user = User.find_by(id: session[:user_id])
	render :profile_page and return
end

def about_get
	@user = User.find_by(id: session[:user_id])
	render :about and return
end

def profile_post
	@user = User.find_by(id: session[:user_id])
 	render :profile_page and return
end

def fish_id_get
	@user = User.find_by(id: session[:user_id])
  	render :fish_id and return
end

def delete_profile_get
	@user = User.find_by(id: session[:user_id])
    render :delete_profile and return
end

def delete_profile_post
	@user = User.find_by(id: session[:user_id])
    if params["commit"] == "Delete Profile"
    session.clear
    @user.destroy
    redirect_to "/" and return
  end
end

def logout_get
	session.clear
	redirect_to "/logged_out" and return
end

def logged_out_get
	render :success
end

def fish_profile_get
	@user = User.find_by(id: session[:user_id])
  name = params[:name]
  @fish_type = FishType.find_by(name: name)
  render :fish_profile and return
end
private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

def profile_params
  params.require(:profile).permit(:avatar, :location, :birth_year, :best_catch, :short_bio)
end


end


