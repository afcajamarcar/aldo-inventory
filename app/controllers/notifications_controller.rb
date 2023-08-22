class NotificationsController < ApplicationController
    before_action :sanitize_data, only: [:create]

    def create
        @notification = Notification.new(notification_params)
    end

    def notification_params
        params.require(:notification).permit(:store, :model, :inventory, :notification_status)
    end

    def sanitize_data
        params[:inventory] = params[:inventory].to_i
    end
end
