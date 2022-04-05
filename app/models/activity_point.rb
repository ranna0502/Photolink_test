class ActivityPoint < ApplicationRecord

  belongs_to :user

  enum activity_status: { photographer: 0, subject: 1 }
end
