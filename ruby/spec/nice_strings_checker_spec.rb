require 'nice_strings_checker'

RSpec.describe NiceStringsChecker, 'a nice strings checker' do

  before do
    @checker = NiceStringsChecker.new
    @string = 'az'
  end

  after do
    lines = File.readlines('input/4.input.txt')
    count = 0
    lines.each do |l|
      if @checker.nice_string?(l)
        count = count + 1
      end
    end

    puts "Ho ho - Found a total of #{count} nice strings"
  end

  it 'should return false for empty string' do    
    expect(@checker.nice_string?('')).to be false
  end

  it 'should return false for illegible string' do
    expect(@checker.nice_string?(@string)).to be false
  end

  context 'when string has two consecutive letters' do
    before do
      @string += 'ss'
    end

    it 'should return false for string' do
     expect(@checker.nice_string?(@string)).to be false 
    end

    context 'when string has three vowels' do
      before do
        @string += 'aa'
      end

      it 'should return true for string' do
       expect(@checker.nice_string?(@string)).to be true
      end

      context 'when string has a forbidden combination of characters' do
        it 'should return false' do
          ['ab','cd','pq','xy'].each do |chars|
            expect(@checker.nice_string?(@string + chars)).to be false
          end
        end
      end
    end
  end
end