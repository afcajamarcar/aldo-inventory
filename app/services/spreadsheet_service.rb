require "spreadsheet"

class SpreadsheetService
  def initialize
    @book = Spreadsheet::Workbook.new
    @main_sheet = @book.create_worksheet
    @main_sheet.name = "Historical Notifications" # For now it's enough to just have one sheet per book
    @main_sheet.row(0).push "store", "model", "inventory", "notification", "created_at"
  end

  def generate_report(notifications)
    notifications.each_with_index do |notification, index|
      @main_sheet.row(index + 1).push notification.store, notification.model, notification.inventory, notification.notification_status, notification.created_at
    end
    currentTime = Time.now.strftime('%Y_%m_%d')
    return @book, "#{currentTime}.xlsx"
  end
end
