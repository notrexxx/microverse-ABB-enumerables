require './enumerables'

describe 'Enumerable' do
  let(:arr) { [1, 2, 3, 4, 5] }
  let(:range) { (1..5) }

  describe '#my_each' do
    it 'returns a enumerator if no block is given' do
      expect(arr.my_each).to be_an Enumerator
      expect(range.my_each).to be_an Enumerator
    end
  end

  describe '#my_each_with_index' do
    it 'returns a enumerator if no block is given' do
      expect(arr.my_each_with_index).to be_an Enumerator
      expect(range.my_each_with_index).to be_an Enumerator
    end
  end

  describe '#my_select' do
    it 'returns a enumerator if no block is given' do
      expect(arr.my_select).to be_an Enumerator
      expect(range.my_select).to be_an Enumerator
    end

    it 'returns array' do
      expect(arr.my_select { |n| n < 1 }).to eq(arr.select { |n| n < 1 })
    end

    it 'returns array::range' do
      expect(range.my_select { |n| n == 3 }).to eq(range.select { |n| n == 3 })
    end
  end
end

describe 'multiply_els' do
  it 'multiply numbers in array' do
    expect(multiply_els([1, 2, 3])).to eq(1 * 2 * 3)
  end
end
