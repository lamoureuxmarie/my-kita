class Template < ApplicationRecord
  validates :title, :content, presence: true
  belongs_to :bookmark
end
