# CR require rails_helper not spec_helper
# require 'spec_helper'
require 'rails_helper'
require 'net/http'
require 'httparty'
require 'pry'

describe "expecting a song" do
  it "finds a song" do
    #vcr
    VCR.use_cassette(:song) do
      #preparation
      @title = 'billie+jean'
      url = HTTParty.get("https://partner.api.beatsmusic.com/v1/api/search?type=track&q=#{@title}&client_id=yupuktqwpjsbdka36drye9fv")
      #execution (the get in this case)

      #expectation
      expect(url['data'].any?).to be true
    end
  end
end
