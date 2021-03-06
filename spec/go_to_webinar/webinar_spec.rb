require_relative '../spec_helper'

RSpec.describe GoToWebinar::Webinar do
  # TODO: Real Account to stub all requests.
  let(:organizer_key) { ENV['TEST_ORGANIZER_KEY'] }
  let(:token) { ENV['TEST_ACCESS_TOKEN'] }

  before do
    GoToWebinar.setup do |config|
      config.access_token = token
      config.organizer_key = organizer_key
      config.url = GoToWebinar::Configuration.default_url
    end
  end

  context :account do
    it 'should return all webinars' do
      # puts GoToWebinar::Webinar.for_account(client, account_key: '$$$$').inspect
    end
  end

  context :organizer  do
    it 'should find a webinar' do
      webinar_key = '4312408135026753026'
      result = GoToWebinar::Webinar.find(webinar_key: webinar_key)
      expect(result).to be_a(GoToWebinar::Webinar)
      expect(result.webinar_key).to eq(webinar_key)
      # puts result.inspect
    end

    it 'should return all webinars' do
      result = GoToWebinar::Webinar.for_organizer
      expect(result).to be_a(Array)
      expect(result.first).to be_a(GoToWebinar::Webinar)
      # puts result.inspect
    end

    it 'should return upcoming webinars' do
      result = GoToWebinar::Webinar.upcoming
      expect(result).to be_a(Array)
      expect(result.first).to be_a(GoToWebinar::Webinar)
    end

    it 'should return historical webinars' do
      result = GoToWebinar::Webinar.historical
      expect(result).to be_a(Array)
      # expect(result.first).to be_a(GoToWebinar::Webinar)
    end
  end
end
