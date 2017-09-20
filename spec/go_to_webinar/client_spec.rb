require_relative '../spec_helper'

RSpec.describe GoToWebinar::Client do
  it 'has a url to API' do
    expect(GoToWebinar::Client.new.url).to eql('https://api.getgo.com/G2W/rest')
    expect(GoToWebinar::Client.new(url: 'https://new.url.com').url).to eql('https://new.url.com')
  end
end
