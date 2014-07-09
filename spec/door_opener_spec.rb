require 'spec_helper'
describe DoorOpener do
  let(:main_pin) { double('main_pin') }
  let(:secondary_pin) { double 'secondary_pin' }
  subject(:door_opener) { DoorOpener.new(main_pin, secondary_pin, 0) }
  describe '#open_main' do
    before { secondary_pin.as_null_object } 
    it "turns the main pin on momentarily, then back off" do
      main_pin.should_receive(:on).ordered
      main_pin.should_receive(:off).ordered 
      door_opener.open_main_door
    end
  end
  describe '#open_secondary' do
    before { main_pin.as_null_object } 
    it "turns the secondary pin on momentarily, then back off" do
      secondary_pin.should_receive(:on).ordered
      secondary_pin.should_receive(:off).ordered 
      door_opener.open_secondary_door
    end
  end
end
