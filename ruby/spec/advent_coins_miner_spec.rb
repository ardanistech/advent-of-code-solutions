require 'advent_coins_miner'
require 'digest'

RSpec.describe AdventCoinsMiner, 'an advent coints miner' do

  before do
    @miner = AdventCoinsMiner.new(10000000)
  end

  it 'should solve the examples provided' do    
    expect(@miner.mine_for('pqrstuv')).to eq('pqrstuv1048970')
    expect(@miner.mine_for('abcdef')).to eq('abcdef609043')
  end

  it 'should provide a coin which has starts with 5 zeros' do
    coin = @miner.mine_for('abcdefg')
    md5 = Digest::MD5.new
    expect(md5.update(coin).to_s).to start_with('00000')
  end
end