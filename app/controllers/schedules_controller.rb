class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :update, :destroy]

  # GET /schedules
  def index
    if params.has_key?(:date)
      @date = Date.strptime(params[:date], '%Y-%m-%d')
      beginning_of_day = Time.zone.parse(@date.to_s)
      ending_of_day = Time.zone.parse(@date.to_s).end_of_day
      @schedules = Schedule.start_between(beginning_of_day, ending_of_day)
    elsif params.has_key?(:activity_id)
      @schedules = Schedule.find_by_activity_id(params[:activity_id])
    else
      @schedules = Schedule.all
    end

    render json: @schedules
  end

  # GET /schedules/1
  def show
    render json: @schedule
  end

  # POST /schedules
  def create
    @current_user = AuthorizeApiRequestCommand.call(request.headers).result
    @activity = Activity.find(schedule_params[:activity_id])
    if @activity[:user_id] != @current_user[:id]
      render json: {"error": "Not the owner of activity"}, status: :unauthorized
      return
    end
    @schedule = Schedule.create(
      :activity => @activity,
      start: schedule_params[:start],
      end: schedule_params[:end]
    )

    if @schedule.save
      render json: @schedule, status: :created, location: @schedule
    else
      render json: @schedule.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def schedule_params
      params.require(:schedule).permit(:activity_id, :_id, :start, :end)
    end
end
