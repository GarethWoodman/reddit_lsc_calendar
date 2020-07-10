require './app/models/subreddit'

class HomeController < ApplicationController
  def index
    subreddit = Subreddit.new()
    @links = subreddit.links
  end
end
