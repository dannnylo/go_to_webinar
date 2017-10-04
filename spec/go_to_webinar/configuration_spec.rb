require_relative '../spec_helper'

RSpec.describe GoToWebinar::Configuration do
  before do
    GoToWebinar.setup do |config|
      config.access_token = 'ACCESSTOKENCONFIG'
      config.organizer_key = 'ORGANIZERKEYCONFIG'
      config.url = 'https://api.test.com'
    end
  end

  it 'define access_token' do
    expect(GoToWebinar.client.access_token).to eql('ACCESSTOKENCONFIG')
    value = GoToWebinar::Client.new(access_token: 'ACCESSTOKENPARAMS').access_token
    expect(value).to eql('ACCESSTOKENPARAMS')
  end

  it 'define organizer_key' do
    expect(GoToWebinar.client.organizer_key).to eql('ORGANIZERKEYCONFIG')
    value = GoToWebinar::Client.new(organizer_key: 'ORGANIZERKEYPARAMS').organizer_key
    expect(value).to eql('ORGANIZERKEYPARAMS')
  end

  it 'define url' do
    expect(GoToWebinar.client.url).to eql('https://api.test.com')
    url = GoToWebinar::Client.new(url: 'https://new.url.com').url
    expect(url).to eql('https://new.url.com')
  end
end
