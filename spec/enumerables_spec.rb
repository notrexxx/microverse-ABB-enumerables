require './enumerables.rb'

describe 'Enumerable' do
  let(:arr) { [1, 2, 3, 4, 5] }
  let(:range) { (1..5) }

  describe '#my_each' do
    it 'returns a enumerator if no block is given' do
      expect(arr.my_each).to be_an Enumerator
      expect(range.my_each).to be_an Enumerator
    end
  end

  
end