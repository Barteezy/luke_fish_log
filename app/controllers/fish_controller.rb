class FishController < ApplicationController
  before_action :set_fish, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  
  def index
    @user = User.find_by(id: session[:user_id])
    @fish = Fish.all
  end

  
  def show
    @user = User.find_by(id: session[:user_id])
  end


  def new
    @user = User.find_by(id: session[:user_id])
    @fish = Fish.new
 
  end

 
  def edit
    @user = User.find_by(id: session[:user_id])
  end

  def create
    @user = User.find_by(id: session[:user_id])
    @fish = Fish.new(fish_params)
    @fish.user_id = @user.id


      if @fish.save
        redirect_to @fish, notice: 'Fish was successfully created.' 
      else
        render action: 'new' 
      end
    
  end

    def update
     @user = User.find_by(id: session[:user_id])
        if @fish.update(fish_params)
            redirect_to @fish, notice: 'Fish was successfully updated.'
        else
            render action: 'edit'
        end
    end

    def destroy
      @user = User.find_by(id: session[:user_id])
      @fish.destroy
      redirect_to fish_index_url 
    end

  private
    def set_fish
      @user = User.find_by(id: session[:user_id])
      @fish = Fish.find(params[:id])
    end

    def correct_user
      @user = User.find_by(id: session[:user_id])
      if @user.id != @fish.user.id 
        flash[:error] = "Not authorized to edit this fish"
        redirect_to "/fish"
      end
    end

    def fish_params
      params.require(:fish).permit(:image, :location, :species, :lenth, :weight, :bait, :depth, :temperature, :other_notes)
    end
end
