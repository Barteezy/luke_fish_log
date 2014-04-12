class FishController < ApplicationController
  before_action :set_fish, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  
  def index
    @user = current_user
    @fish = Fish.all
  end

  def recent
    @user = current_user
    @fish = Fish.all
  end

  
  def show
    @user = current_user
  end


  def new
    @user = current_user
    @fish = Fish.new
 
  end

 
  def edit
    @user = current_user
  end

  def create
    @user = current_user
    @fish = Fish.new(fish_params)
    @fish.user_id = @user.id


      if @fish.save
        redirect_to @fish, notice: 'Fish was successfully created.' 
      else
        render action: 'new' 
      end
    
  end

    def update
     @user = current_user
        if @fish.update(fish_params)
            redirect_to @fish, notice: 'Fish was successfully updated.'
        else
            render action: 'edit'
        end
    end

    def destroy
      @user = current_user
      @fish.destroy
      redirect_to fish_index_url 
    end

  private
    def set_fish
      @user = current_user
      @fish = Fish.find(params[:id])
    end

    def correct_user
      @user = current_user
      if @user.id != @fish.user.id 
        flash[:error] = "Not authorized to edit this fish"
        redirect_to "/fish"
      end
    end

    def fish_params
      params.require(:fish).permit(:image, :location, :species, :lenth, :weight, :bait, :depth, :temperature, :other_notes)
    end
end
