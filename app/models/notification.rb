class Notification < ApplicationRecord
    validates :store, presence: true
    validates :model, presence: true
    validates :inventory, presence: true
    validates :notification_status, presence: true
end
