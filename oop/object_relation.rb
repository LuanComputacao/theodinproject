class Cinema
  attr_accessor :name, :location, :movies
  def initialize(name, location)
    @name = name
    @location = location
    @movies = []
  end

  def add_movie(movie)
    @movies << movie
    movie.cinema = self 
  end
end

class Movie
  @@all = []

  attr_accessor :title, :showtime, :cinema

  def initialize(title, showtime)
    @title = title
    @showtime = showtime
    @@all << self
  end

  def to_s
    "'#{@title}' at #{@showtime}"
  end
end

the_last_of_us = Movie.new "The Last of Us", "18:00"

cinema = Cinema.new "UCI Estação", "Estação"
cinema.add_movie the_last_of_us

p the_last_of_us.to_s
p cinema.movies