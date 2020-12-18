require 'rails_helper'
require 'nokogiri'
require 'open-uri'
require 'json'

RSpec.describe 'Login to Capital One' do
  it 'can login to Capital One' do

    # card_path = '/Users/travisgm/personal_project/credit_cards/monies/data/transactions.csv'
    #
    # locations = {
    #   info: card_path
    # }
    # data = CSV.read(locations[:info], headers: true, header_converters: :symbol)
    class Scraper
      class << self # this says all methods are class methods, no need to do self.method_name

        def get_data(url)
          data = URI.open(url)
          parsed = Nokogiri::HTML(data)
          p_tags = parsed.css('p').text.split("\n")

          # the code below saves the p_tags info as a JSON object into a file in this application

          # json = {paragraphs: p_tags}
          # File.open('alan.json', 'w') do |file|
          #   file.write(JSON.pretty_generate(json))
          # end
          require "pry"; binding.pry
        end
      end
    end

    Scraper.get_data('https://verified.capitalone.com/auth/signin')

  end
end
