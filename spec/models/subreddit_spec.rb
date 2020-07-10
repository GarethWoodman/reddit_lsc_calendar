require './app/models/subreddit'

describe Subreddit do
  it 'has links' do
    expect(subject).to respond_to(:links)
  end

  it 'link has a date' do
    first_link = ""
    subject.links.each { |link| first_link = link if link.date}
    expect(first_link.date.include?("2020")).to eq(true)
  end
end
