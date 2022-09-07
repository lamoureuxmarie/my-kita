class Bookmark < ApplicationRecord
  belongs_to :kinder_garten
  belongs_to :user
  has_many :reminders

  # ICONS = {
  #   "Send Email" => "fa-solid fa-envelope icon-status";
  #   "Make a call" => "fa-solid fa-phone icon-status";

  # }
end
