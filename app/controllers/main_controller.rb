class MainController < ApplicationController

def root
	@user = User.find_by(id: session[:user_id])
	render :index
end

def login_get
	@user = User.find_by(id: session[:user_id])
	render :login
end


end

