class Movie < ApplicationRecord
  belongs_to :genre, optional: true

  def self.search_by_keyword(keyword)
    if keyword.present?
      left_joins(:genre)
      .where("movies.title like :keyword or genres.name like :keyword", keyword: "%#{keyword}%")
    else
      all
    end
  end
end
