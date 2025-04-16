require_relative '../src/bubble_sort'

RSpec.describe "#bubble_sort" do
  it 'should order 1 missplaced number' do
    given = [5, 1, 2, 3, 4]
    expected = [1, 2, 3, 4, 5]
    result = bubble_sort(given)

    expect(result).to eq(expected)
  end

  it 'should order worst case' do
    given = [5, 4, 3, 2, 1]
    expected = [1, 2, 3, 4, 5]
    result = bubble_sort(given)

    expect(result).to eq(expected)
  end
end
