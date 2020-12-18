# frozen_string_literal: true

require 'rails_helper'

describe 'Transaction calculations' do
  before :each do
    card_path = '/Users/travisgm/personal_project/credit_cards/monies/data/transactions.csv'

    locations = {
      info: card_path
    }
    @data = CSV.read(locations[:info], headers: true, header_converters: :symbol)
  end
  it 'can calculate total depending on card owner' do
    array = []
    @data.each do |row|
      array << Transaction.new(row)
    end

    start = '2020-11-02'
    ending = '2020-11-04'

    L_total = Calculations.total(array, start, ending)

    expect(L_total).to eq()
  end
end
