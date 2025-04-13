# frozen_string_literal: true

require_relative '../stock_picker'

RSpec.describe "#stock_picker" do
  it 'Profit from the first day buying' do
    result = stock_picker([1, 2, 3, 4])
    expect(result).to eq([0, 3])
  end

  it 'Profit from the second day buying' do
    result = stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
    expect(result).to eq([1, 4])
  end

  it 'Profit from the second step buying' do
    result = stock_picker([17, 9, 10, 15, 8, 6, 1, 10])
    expect(result).to eq([6, 7])
  end

  it 'Profit from the first day until second step buying' do
    result = stock_picker([17, 3, 6, 9, 10, 8, 6, 1, 15])
    expect(result).to eq([7, 8])
  end
end
