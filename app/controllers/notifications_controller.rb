class NotificationsController < ApplicationController
  before_action :sanitize_data, only: [:create]

  def index
    @notifications = Notification.all
    report = SpreadsheetService.new.generate_report(@notifications)
    puts 'filename'
    puts report[1]
    buffer = StringIO.new
    report[0].write(buffer)
    buffer.rewind
    send_data buffer.read, filename: report[1], type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
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
