class Vector
  attr_reader :coordinates
  attr_reader :dimension

  def to_s
    "Vector: #{coordinates}"
  end

  def ==(other)
    coordinates == other.coordinates
  end

  def +(other)
    validate_dimensions(other)

    self.class.new(coordinates.zip(other.coordinates).map(&:sum))
  end

  def -(other)
    validate_dimensions(other)

    self.class.new(coordinates.zip(other.coordinates).map{ |a| a.inject(:-) })
  end

  def *(value)
    self.class.new(coordinates.map { |coord| coord * value })
  end

  private

  def initialize(coords)
    raise ArgumentError, 'Coordinates must be given' unless coords
    unless coords.is_a?(Enumerable)
      raise ArgumentError, 'Coordinates must be an Enumerable'
    end

    @coordinates = Array(coords)
    @dimension = coords.length
  end

  def validate_dimensions(other)
    unless dimension == other.dimension
      raise ArgumentError, 'Vectors must have the same dimension'
    end
  end
end
