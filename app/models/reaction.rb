class Reaction < ApplicationRecord

  has_many :notifications, dependent: :destroy
  belongs_to :to_user, class_name: "User"
  belongs_to :from_user, class_name: "User"

end
