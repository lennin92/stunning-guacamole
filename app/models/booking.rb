class Booking < ApplicationRecord
  belongs_to :schedule
  belongs_to :user


  scope :user_relations,
        lambda {|user_id, admin_id| joins(schedule: :activity)
                                      .where("bookings.user_id = ? OR activities.user_id = ?", user_id, admin_id )
                                      .select("bookings.*")}
end
