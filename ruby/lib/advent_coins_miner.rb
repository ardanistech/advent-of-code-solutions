require 'digest'

class AdventCoinsMiner 
  def initialize(ceiling)
    @ceiling = ceiling
  end

  def mine_for(secret)
    (1..@ceiling).each do |num|
      coin = "#{secret}#{num}"
      md5 = Digest::MD5.new
      md5.update coin
      if(md5.hexdigest.start_with?('00000'))
        return coin
      end
    end
    raise 'could not find a coin - soz'
  end
end