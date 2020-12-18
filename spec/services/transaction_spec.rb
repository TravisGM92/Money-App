# frozen_string_literal: true

require 'rails_helper'

describe 'Creates a transaction object for each row' do
  before :each do
    card_path = '/Users/travisgm/personal_project/credit_cards/monies/data/transactions.csv'

    locations = {
      info: card_path
    }
    @data = CSV.read(locations[:info], headers: true, header_converters: :symbol)
  end
  it 'creates a new transaction object per line of CSV file' do
    array = []
    @data.each do |row|
      array << Transaction.new(row)
    end
    array.each do |trans|
      expect(trans).to be_a(Transaction)
      expect(trans.transaction_date).to be_a(String)
      expect(trans.posted_date).to be_a(String)
      expect(trans.description).to be_a(String)
      expect(trans.transaction_date).to be_a(String)
      expect(trans.card).to be_an(Integer)
      if trans.credit.nil?
        expect(trans.debit).to be_a(Float)
      else
        expect(trans.credit).to be_a(Float)
      end
    end
  end
end
