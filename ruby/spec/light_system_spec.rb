require 'light_system'

RSpec.describe LightSystem, 'a light system' do
  let(:lights_on) { @system.get_total_lights_by_value(true) }
  let(:lights_off) { @system.get_total_lights_by_value(false) }

  before do
    @system = LightSystem.new(1000, 1000)
    @max_lights = 1000000
  end

  it 'should initialize to the requested number of lights' do    
    expect(@system.get_total_lights).to eq(@max_lights)
  end

  it 'should start with all lights turned off' do
    expect(lights_off).to eq(@max_lights)
  end

  it 'should start with no lights turned on' do
    expect(lights_on).to eq(0)
  end

  context 'when all lights are on' do
    before do 
      @system.turn_on_range(0, 0, 999, 999)
    end

    it 'should have all lights on' do
      expect(lights_on).to eq(@max_lights)
    end

    it 'should turn off a range' do
      @system.turn_off_range(0, 0, 0, 999)
      expect(lights_off).to eq(1000)
    end

    it 'should toggle a range to off' do
      @system.toggle_range(0, 0, 0, 999)
      expect(lights_off).to eq(1000)
    end
  end

  it 'file solver test' do
    File.readlines('input/5.input.txt').each do |l|
      "turn off 301,3 through 808,453
      turn on 351,678 through 951,908
      toggle 720,196 through 897,994"

      @turn_on_regex = /turn on (\d+),(\d+) through (\d+),(\d+)/
      @turn_off_regex = /turn off (\d+),(\d+) through (\d+),(\d+)/
      @toggle_regex = /toggle (\d+),(\d+) through (\d+),(\d+)/

      if(m = @turn_on_regex.match(l))
        #puts "turning on #{m[1]}, #{m[2]} through #{m[3]}, #{m[4]}"
        @system.turn_on_range(m[1].to_i, m[2].to_i, m[3].to_i, m[4].to_i)
      elsif(m = @turn_off_regex.match(l))
        #puts "turning off #{m[1]}, #{m[2]} through #{m[3]}, #{m[4]}"
        @system.turn_off_range(m[1].to_i, m[2].to_i, m[3].to_i, m[4].to_i)
      elsif(m = @toggle_regex.match(l))
        #puts "toggling #{m[1]}, #{m[2]} through  #{m[3]} #{m[4]}"
        @system.toggle_range(m[1].to_i, m[2].to_i, m[3].to_i, m[4].to_i)
      end
    end

    puts "final lights count #{lights_on}"
  end
end