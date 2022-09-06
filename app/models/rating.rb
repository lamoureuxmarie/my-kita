class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :kinder_garten

  def self.rating_by_kita(kita)
    ratings = Rating.where(kinder_garten: kita).map { |star| star.rating }
    ratings.empty? ? 0 : ratings.sum / ratings.count
  end

  def self.rating_count(kita)
    ratings = Rating.where(kinder_garten: kita).map { |star| star.rating }
    ratings.count
  end
end
