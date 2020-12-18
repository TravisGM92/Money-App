require 'rails_helper'

RSpec.describe 'Parse CSV' do
  it 'grab the date CSV file within the date range of last month 27th, to this month 27th' do

    card_path = '/Users/travisgm/personal_project/credit_cards/monies/data/transactions.csv'

    locations = {
      info: card_path
    }
    data = CSV.read(locations[:info], headers: true, header_converters: :symbol)


    #most recent transaction, posted date
    #year
    recent_transaction_year = data[0][1].split('-')[0]
    recent_transaction_month = data[0][1].split('-')[1]
    recent_transaction_day = data[0][1].split('-')[2]

    expect('2020').to eq(recent_transaction_year)
    #month
    expect('11').to eq(recent_transaction_month)
    #day
    expect('27').to eq(recent_transaction_day)

    first_transaction_year = data[-1][1].split('-')[0]
    first_transaction_month = data[-1][1].split('-')[1]
    first_transaction_day = data[-1][1].split('-')[2]

    #first transaction of this period
    #year
    expect(first_transaction_year).to eq('2020')
    #month
    expect(first_transaction_month).to eq('11')
    #day
    expect(first_transaction_day).to eq('02')


    # row[0] is transaction date
    # row[1] is posted date
    # row[2] is card number
    # row[3] is description
    # row[4] is category
    # row[5] is debit
    # row[6] is credit

    # L

    L = 0.0
    total = data.map do |row|
      if row[2] == ENV["L_NUMBS"]
        if row[6].nil?
          L += row[5].to_f
        else
          L -= row[6].to_f
        end
      end
    end


    # K

    K = 0.0
    total = data.map do |row|
      if row[2] == ENV['K_NUMBS']
        if row[6].nil?
          K += row[5].to_f
        else
          K -= row[6].to_f
        end
      end
    end
    start_date = "#{first_transaction_month}/#{first_transaction_day}/#{first_transaction_year}"
    end_date = "#{recent_transaction_month}/#{recent_transaction_day}/#{recent_transaction_year}"

    totals = {'Start range': start_date, 'End range': end_date, 'K': K.round(2), 'L': L.round(2)}
    # require "pry"; binding.pry

  end
end
