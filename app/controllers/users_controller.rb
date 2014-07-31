class UsersController < ApplicationController

 skip_before_filter :authenticate_user!, :only => :show, :if => lambda { 
    if params[:id]
      @user = User.find(params[:id])
      @user and @user.public?
    else
      false
    end
  }

  def new

  end

  def show
  	@user = User.find(params[:id])
  end

  def index
  	@user = User.all
  end

end
