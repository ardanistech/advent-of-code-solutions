class SantaDeliveries
  Point = Struct.new(:x, :y)

	def initialize()
    @deliveries = Hash.new
    @currentLocation = Point.new(0, 0)
	end

	def count_houses
    @deliveries.count
	end

	def deliver_to(direction)
    case direction
      when '>'
        @currentLocation = Point.new(@currentLocation.x + 1,
          @currentLocation.y)
      when 'v'
        @currentLocation = Point.new(@currentLocation.x,
          @currentLocation.y - 1)
      when '^'
        @currentLocation = Point.new(@currentLocation.x,
          @currentLocation.y + 1)
      when '<'
        @currentLocation = Point.new(@currentLocation.x - 1,
          @currentLocation.y)
      else
        raise "bad input #{direction}"
      end

      locationKey = "#{@currentLocation.x},#{@currentLocation.y}"
      puts locationKey
      if(@deliveries[locationKey])
        @deliveries[locationKey] = @deliveries[locationKey] + 1
      else
        @deliveries[locationKey] = 1
      end
	end
end