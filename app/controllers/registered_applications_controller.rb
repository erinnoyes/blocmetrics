class RegisteredApplicationsController < ApplicationController
  def index
    @user = current_user
    @apps = RegisteredApplication.where(user_id: @user.id)
  end

  def show
  end

  def new
    @app = RegisteredApplication.new
  end

  def edit
  end

  def create
    @user = current_user
    @app = RegisteredApplication.new(app_params)
    @app.user = @user
    @app.save!

    redirect_to action: "index"

  end

  def destroy
    @app = RegisteredApplication.find(params[:id])
    @app.destroy

    redirect_to authenticated_root_path
  end

private

  def app_params
    params.require(:registered_application).permit(:name, :url, :user_id)
  end
end
