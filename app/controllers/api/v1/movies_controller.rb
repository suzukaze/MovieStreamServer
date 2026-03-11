class Api::V1::MoviesController < ApplicationController
  def index
    movies = Movie.all
    limit = params[:limit].to_i
    if limit > 0
      movies = movies.limit(limit)
    end

    render json: {
      movies: movies
    }
  end

  def search
    keyword = params[:keyword]
    movies = Movie.search_by_keyword(keyword)

    render json: {
      movies: movies
    }
  end
end
