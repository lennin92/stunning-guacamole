class Activity < ApplicationRecord
  belongs_to :activity_type
  belongs_to :user
end
