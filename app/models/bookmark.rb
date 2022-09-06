class Bookmark < ApplicationRecord
  belongs_to :kinder_garten
  belongs_to :user
  has_many :reminders
<<<<<<< HEAD
  has_many :templates
=======

  # ICONS = {
  #   "Send Email" => "fa-solid fa-envelope icon-status";
  #   "Make a call" => "fa-solid fa-phone icon-status";

  # }
>>>>>>> aa525cba5ea31be13613c073548adee22103c47e
end
