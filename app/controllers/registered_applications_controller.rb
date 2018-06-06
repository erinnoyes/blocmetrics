class RegisteredApplicationsController < ApplicationController
  def index
     @apps = current_user.registered_applications
  end

  def show
    @app = RegisteredApplication.find(params[:id])
    @events = @app.events.group_by(&:name)
  end

  def new
    @app = RegisteredApplication.new
  end

  def edit
  end

  def create
    @app = current_user.registered_applications.new(app_params)
    @app.save!

    redirect_to authenticated_root_path
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
