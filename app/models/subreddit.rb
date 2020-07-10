require "ruby_reddit_api"

class Subreddit
  attr_reader :links

  def initialize(subreddit = "LondonSocialClub")
    @client = Reddit::Api.new
    @links = @client.browse subreddit
    construct_links
  end

  private
  def construct_links
    @links = @links.map { |link| Link.new(link)}
  end

end

class Link
  attr_reader :title, :context
  def initialize(object)
    @object  = object
    @title   = object.title
    @context = object.selftext
  end

  def date
    date = @object.title.scan(/[0-9]*\/[0-9]*\/[0-9]{2,}/)
    date[0]
  end
end
