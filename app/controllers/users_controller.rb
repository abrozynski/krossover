class UsersController < ApplicationController

	load_and_authorize_resource
	skip_authorize_resource :only => [:show]

  def new

  end

  def show
  	@user = User.find(params[:id])
  end

  def index
  	@user = User.all
  end

end
