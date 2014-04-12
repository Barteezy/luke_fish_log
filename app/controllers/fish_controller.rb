class FishController < ApplicationController
  before_action :set_fish, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @fish = Fish.all
  end

  def recent
    @fish = Fish.all
  end

  def new
    @fish = Fish.new
  end

  def create
    @fish = current_user.fish.build(fish_params)

    if @fish.save
      redirect_to @fish, notice: 'Fish was successfully created.' 
    else
      render action: 'new' 
    end
  end

  def update
    if @fish.update(fish_params)
      redirect_to @fish, notice: 'Fish was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @fish.destroy
    redirect_to fish_index_url 
  end

  private

  def set_fish
    @fish = Fish.find(params[:id])
  end

  def correct_user
    if @fish.user == current_user
      flash[:error] = "Not authorized to edit this fish"
      redirect_to "/fish"
    end
  end

  def fish_params
    params.require(:fish).permit(:image, :location, :species, :lenth, :weight, :bait, :depth, :temperature, :other_notes)
  end
end
