class NotificationsController < ApplicationController
  before_action :sanitize_data, only: [:create]

  def index
    @notifications = Notification.all
    report = SpreadsheetService.new.generate_report(@notifications)
    tempfile = Tempfile.new(report[1])
    report[0].write(tempfile.path)
    send_file tempfile.path, :filename => report[1]
  end

  def create
    @notification = Notification.new(notification_params)

    if @notification.save
      render json: { message: @notification.created_at }
    else
      render json: { errors: @notification.errors }, status: :internal_server_error
    end
  end

  def notification_params
    params.require(:notification).permit(:store, :model, :inventory, :notification_status)
  end

  def sanitize_data
    params[:inventory] = params[:inventory].to_i
  end
end
