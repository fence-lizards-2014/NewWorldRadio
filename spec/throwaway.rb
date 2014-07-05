require 'spec_helper'
require 'net/http'

describe "going to google.com" do
  it "renders the google homepage" do
    #vcr
    VCR.use_cassette(:google_test) do
      #preparation
      url = URI.parse('http://www.google.com')
      #execution
      page = Net::HTTP.get(url)
      #expectation
      expect(page).to have_content('google')
    end
  end
end