class Template < ApplicationRecord
  validates :title, :content, presence: true
end
