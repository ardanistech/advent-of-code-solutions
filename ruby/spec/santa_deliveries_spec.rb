require 'santa_deliveries'

RSpec.describe SantaDeliveries, "when santa starts the present deliveries" do
	let(:deliveries) { @santa_deliveries.count_houses}

	before do
		@santa_deliveries = SantaDeliveries.new
	end

	it 'should deliver to none' do
		expect(deliveries).to eq(0)
	end

	context 'when navigating to a house' do
		before do
			@santa_deliveries.deliver_to('>')
		end

		it "should deliver one house" do
			expect(deliveries).to eq(1)
		end
	end

	context "when navigating to two houses" do
		before do 
			'>>'.each_char do |x| 
				@santa_deliveries.deliver_to(x)
			end
		end

		it "should deliver to two" do
			expect(deliveries).to eq(2)
		end
	end

	context "when navigating to the same house twice" do
		before do 
			'>><'.each_char do |x| 
				@santa_deliveries.deliver_to(x)
			end
		end

		it "should deliver to two unique houses" do
			expect(deliveries).to eq(2)
		end
	end

	context "when navigating to all directions" do
		before do 
			'><^<v'.each_char do |x| 
				@santa_deliveries.deliver_to(x)
			end
		end

		it "should deliver to all houses" do
			expect(deliveries).to eq(5)
		end
	end
end