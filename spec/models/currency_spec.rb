require 'rails_helper'

RSpec.describe Currency, type: :model do
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:currency_type) }

  it 'should trow error for invalid value of currency type' do
    expect { build(:currency, currency_type: 'invalid') }.to raise_error(ArgumentError)
  end
end
