class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  
  def index
    @user = current_user
    @profiles = Profile.all
  end

  def show
    @user = current_user
  end

  def new
    @user = current_user
    @profile = Profile.new
  end

  def edit
    @user = current_user
  end

  
  def create
    @user = current_user
    @profile = Profile.new(profile_params)
     @profile.user_id = @user.id

    if @profile.save
      redirect_to @profile, notice: 'Profile was successfully created.' 
    else
      render action: 'new' 
    end
 
  end

  
  def update
    @user = current_user
    if @profile.update(profile_params)
      redirect_to @profile, notice: 'Profile was successfully updated.'   
    else
      render action: 'edit' 
    end
  end


  def destroy
    @user = current_user
    @profile.destroy
  
    redirect_to profiles_url 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @user = current_user
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:avatar, :avatar_file_name, :location, :birth_year, :favorite_target, :best_catch, :short_bio)
    end
end
