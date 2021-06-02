class Schedule < ApplicationRecord
  belongs_to :activity

  scope :start_between,
        lambda {|start_date, end_date| where("start >= ? AND start <= ?", start_date, end_date )}
end
