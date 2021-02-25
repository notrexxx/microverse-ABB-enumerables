require './enumerables'

describe 'Enumerable' do
  let(:arr) { [1, 2, 3, 4, 5] }
  let(:range) { (1..5) }
  let(:str) { %w[string of words] }
  let(:int) { Integer }
  let(:num) { Numeric }
  let(:fl) { Float }

  describe '#my_each' do
    it 'returns a enumerator if no block is given' do
      expect(arr.my_each).to be_an Enumerator
      expect(range.my_each).to be_an Enumerator
    end

    it 'returns array' do
      expect(arr.my_each { |n| puts n }).to eq(arr.my_each { |n| puts n })
    end

    it 'returns array::range' do
      expect(range.my_each { |n| puts n }).to eq(range.my_each { |n| puts n })
    end
  end

  describe '#my_each_with_index' do
    it 'returns a enumerator if no block is given' do
      expect(arr.my_each_with_index).to be_an Enumerator
      expect(range.my_each_with_index).to be_an Enumerator
    end

    it 'returns array' do
      expect(arr.my_each_with_index { |n, _i| puts n }).to eq(arr.my_each_with_index { |n, _i| puts n })
    end

    it 'returns array::range' do
      expect(range.my_each_with_index { |n, _i| puts n }).to eq(range.my_each_with_index { |n, _i| puts n })
    end
  end

  describe '#my_select' do
    it 'returns a enumerator if no block is given' do
      expect(arr.my_select).to be_an Enumerator
      expect(range.my_select).to be_an Enumerator
    end

    it 'returns array' do
      expect(arr.my_select { |n| puts n }).to eq(arr.my_select { |n| puts n })
    end

    it 'returns array::range' do
      expect(range.my_select { |n| puts n }).to eq(range.my_select { |n| puts n })
    end
  end

  describe '#my_all?' do
    it 'every class is true' do
      expect(arr.my_all? { |n| n == int }).to eq(arr.my_all? { |n| n == int })
    end

    it 'every element matches argument' do
      expect(arr.my_all?(num)).to eq(arr.my_all?(num))
    end

    it 'everthing is true' do
      expect(arr.my_all?).to eq(arr.my_all?)
    end

    it 'check if empty' do
      expect([].my_all?).to eq([].my_all?)
    end
  end

  describe '#my_any?' do
    it 'one is true' do
      expect(str.my_any? { |n| n }).to eq(str.my_any? { |n| n })
    end

    it 'one matches argument' do
      expect([].my_any?(int)).to eq([].my_any?(int))
    end

    it 'one is true' do
      expect([].my_any?).to eq([].my_any?)
    end

    it 'check if empty' do
      expect([].my_any?).to eq([].my_any?)
    end
  end

  describe '#my_none?' do
    it 'one is false' do
      expect(str.my_none? { |n| n }).to eq(str.my_none? { |n| n })
    end

    it 'one matches argument' do
      expect([].my_none?(int)).to eq([].my_none?(int))
    end

    it 'check if empty' do
      expect([].my_none?).to eq([].my_none?)
    end

    it 'check if nil' do
      expect([nil].my_none?).to eq([nil].my_none?)
    end

    it 'check if true' do
      expect([true].my_none?).to eq([true].my_none?)
    end

    it 'check if none matches the regexp' do
      expect(str.my_none?(/d/)).to eq(str.my_none?(/d/))
    end
  end

  describe '#my_count' do
    it 'count elements in array' do
      expect(arr.my_count).to eq(arr.my_count)
    end

    it 'count elements in range' do
      expect(range.my_count).to eq(range.my_count)
    end

    it 'count block given' do
      expect(arr.my_count { |n| n }).to eq(arr.my_count { |n| n })
    end

    it 'count number of items' do
      expect(arr.my_count(1)).to eq arr.my_count(5)
    end
  end

  describe '#my_map' do
    it 'returns an Enumerator if no block is given' do
      expect(arr.my_map).to be_an Enumerator
      expect(range.my_map).to be_an Enumerator
    end

    it 'returns array' do
      expect(arr.my_map { |n| n }).to eq(arr.my_map { |n| n })
    end

    it 'returns array::range' do
      expect(range.my_map { |n| n }).to eq(range.my_map { |n| n })
    end
  end

  describe '#my_inject' do
    it 'raises a LocalJumpError' do
      expect { arr.my_inject }.to raise_error(LocalJumpError)
    end
    it 'Sum' do
      expect((5..10).my_inject(:+)).to eq((5..10).my_inject(:+))
    end

    it 'block and inject' do
      expect((5..10).my_inject { |a, b| a + b }).to eq((5..10).my_inject { |a, b| a + b })
    end

    it 'multiply' do
      expect((5..10).my_inject(1, :*)).to eq((5..10).my_inject(1, :*))
    end
  end
end

describe 'multiply_els' do
  it 'multiply numbers' do
    expect(multiply_els([1, 2, 3])).to eq(1 * 2 * 3)
  end
end
