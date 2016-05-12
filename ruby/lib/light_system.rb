class LightSystem
  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    init_lights
  end

  def get_total_lights
    (@rows) * (@columns)
  end

  def init_lights
    @lights = []
    (0..@rows - 1).each do |n|
      @lights[n] = []
      (0..@columns - 1).each do |c|
        @lights[n][c] = false
      end
    end
  end

  def get_total_lights_by_value(value)
    lights = 0
    on_all do |row, column|
      if @lights[row][column] == value
        lights += 1
      end
    end
    lights
  end

  def on_all(&block)
    (0..@rows - 1).each do |row|
      (0..@columns - 1).each do |column|
        yield row, column
      end
    end
  end

  def on_range(from_row, from_column, to_row, to_column, &block)
    (from_row..to_row).each do |row|
      (from_column..to_column).each do |column|
        yield row, column
      end
    end
  end

  def turn_on_range(from_row, from_column, to_row, to_column)
    on_range from_row, from_column, to_row, to_column do |row, column|
      @lights[row][column] = true
    end
  end

  def turn_off_range(from_row, from_column, to_row, to_column)
    on_range from_row, from_column, to_row, to_column do |row, column|
      @lights[row][column] = false
    end
  end

  def toggle_range(from_row, from_column, to_row, to_column)
    on_range from_row, from_column, to_row, to_column do |row, column|
      @lights[row][column] = !@lights[row][column]
    end
  end
end