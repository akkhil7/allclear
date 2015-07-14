class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications
    render json: @notifications, status: 200
  end
  def create
    @notification = Notification.new()
    @notification.user_ids.each do |id|
      user = User.find(id)
      user.notifications << @notifcation
      user.save!
    end
    if @notification.save!
      render json: @notification, status: 200
    else
      render json: @notification.errors, status: 422
    end
  end

  def notification_params
    params.require(:notification).permit(:message, :user_ids => [])
  end
end
