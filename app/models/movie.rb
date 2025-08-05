t.references :genre, null: true, foreign_key: true

class Movie < ApplicationRecord
  belongs_to :genre, optional: true
end
