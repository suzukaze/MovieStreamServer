class MoviesController < ApplicationController
  def search
    keyword = params[:keyword]
    movies = Movie.search_by_keyword(keyword)
    genres = Genre.all

    render json: {
      movies: movies,
      genres: genres
    }
  end
end
