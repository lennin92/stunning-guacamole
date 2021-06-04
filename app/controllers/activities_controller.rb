class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :update, :destroy]

  # GET /activities
  def index
    @activities = Activity.all
    render json: @activities
  end

  # GET /activities/1
  def show
    render json: @activity
  end

  # POST /activities
  def create
    @current_user = AuthorizeApiRequestCommand.call(request.headers).result

    if !@current_user[:admin]
      render json: {"error": "Not an admin"}, status: :unauthorized
      return
    end
    @activity_type = ActivityType.find(activity_params[:activity_type_id])

    @activity = Activity.create(
      :activity_type => @activity_type,
      :user => @current_user,
      location: activity_params[:location],
      description: activity_params[:description],
      name: activity_params[:name]
    )

    if @activity.save
      render json: @activity, status: :created, location: @activity
    else
      render json: @activity.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_params
      params.require(:activity).permit(:activity_type_id, :name, :description, :location)
    end
end
