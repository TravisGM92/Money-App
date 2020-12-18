class Transaction
  attr_reader :transaction_date,
              :posted_date,
              :card,
              :description,
              :category,
              :debit,
              :credit

  def initialize(data)
    @transaction_date = data[0]
    @posted_date = data[1]
    @card = data[2].to_i
    @description = data[3]
    @category = data[4]
    @debit = data[5].to_f
    @credit = data[6].to_f
  end
end
