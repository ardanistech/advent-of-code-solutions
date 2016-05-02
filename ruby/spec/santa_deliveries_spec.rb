require 'santa_deliveries'

RSpec.describe SantaDeliveries do
	it 'should deliver to none' do
		assert 0, @santa_deliveries.count_houses
	end

	context 'when navigating to > house' do
		before do
			@santa_deliveries.deliver_to('>')
		end

		it 'should return 1' do
		end
	end
end