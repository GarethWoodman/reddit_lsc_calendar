require "ruby_reddit_api"

class Subreddit
  attr_reader :links

  def initialize(subreddit = "LondonSocialClub")
    @client = Reddit::Api.new
    @links = @client.browse subreddit, {limit: 120}
    construct_links
  end

  private
  def construct_links
    @links = @links.map { |link| Link.new(link)}
  end

end

class Link
  attr_reader :title, :context, :url
  def initialize(object)
    @object  = object
    @title   = object.title
    @context = object.selftext
    @url     = object.url
  end

  def date
    date = @object.title.scan(/[0-9]*\/[0-9]*\/[0-9]{2,}/)
    formatted(date[0]) if date.any?
  end

  private
  def formatted(date)
    day = date[0..1]
    month = date[3..4]
    year = date[6..7] + "20"

    "#{year}-#{month}-#{day}"
  end
end
