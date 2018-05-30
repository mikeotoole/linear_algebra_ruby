require 'minitest/autorun'
require './lib/vector'

describe Vector do
  let(:coords) { [2, 4] }
  let(:vector) { Vector.new(coords) }
  let(:vector_two) { Vector.new([2, 3]) }

  describe '#new' do
    it 'raises an error when no coordinates are given' do
      assert_raises(ArgumentError) { Vector.new(nil) }
    end

    it 'raises an error when coordinates are not an Enumerable' do
      assert_raises(ArgumentError) { Vector.new('bad') }
    end

    it 'sets coordinates' do
      assert_equal coords, vector.coordinates
    end

    it 'sets dimension' do
      assert_equal 2, vector.dimension
    end
  end

  describe '#to_s' do
    it 'returns a string with the coordinates' do
      assert_equal 'Vector: [2, 4]', vector.to_s
    end
  end

  describe '#==' do
    describe 'when vectors have same coordinates' do
      let(:vector_two) { Vector.new([2, 4]) }

      it 'returns true' do
        assert_equal vector_two, vector
      end
    end

    describe 'when vectors have different coordinates' do
      it 'returns false' do
        refute_equal vector_two, vector
      end
    end
  end

  describe '#+' do
    let(:correct_vector) { Vector.new([4, 7]) }

    it 'returns a new Vector' do
      assert_instance_of Vector, vector + vector_two
    end

    it 'returns a Vector with the correct coordinates' do
      assert_equal correct_vector, vector + vector_two
    end

    describe 'when vectors have different dimensions' do
      let(:bad_vector) { Vector.new([4, 7, 8]) }

      it 'raises and error' do
        assert_raises(ArgumentError) { vector + bad_vector }
      end
    end
  end

  describe '#-' do
    let(:correct_vector) { Vector.new([0, 1]) }

    it 'returns a Vector' do
      assert_instance_of Vector, vector - vector_two
    end

    it 'returns a Vector with the correct coordinates' do
      assert_equal correct_vector, vector - vector_two
    end

    describe 'when vectors have different dimensions' do
      let(:bad_vector) { Vector.new([4, 7, 8]) }

      it 'raises and error' do
        assert_raises(ArgumentError) { vector - bad_vector }
      end
    end
  end

  describe '#*' do
    let(:correct_vector) { Vector.new([6, 12]) }

    it 'returns a Vector' do
      assert_instance_of Vector, vector * 3
    end

    it 'returns a Vector with the correct coordinates' do
      assert_equal correct_vector, vector * 3
    end
  end
end
