class Api::V1::MoviesController < ApplicationController
  def search
    keyword = params[:keyword]
    movies = Movie.search_by_keyword(keyword)

    render json: {
      movies: movies
    }
  end
end
