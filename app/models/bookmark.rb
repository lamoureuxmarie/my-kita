class Bookmark < ApplicationRecord
  belongs_to :kinder_garten
  belongs_to :user
  has_many :reminders, dependent: :destroy

  enum :status, [:liked, :called, :schedulled, :emailed], default: :liked

  ICONS = {
    liked: "fa-heart",
    called: "fa-phone",
    schedulled: "fa-calendar",
    emailed: "fa-envelope"
  }

  def icon
    ICONS[status.to_sym]
  end
end
