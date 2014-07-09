class DoorOpener
  def initialize main_pin = PiPiper::Pin.new(:pin => 4, :direction => :out), secondary_pin PiPiper::Pin.new(:pin => 17, :direction => :out)
    @main_pin = main_pin
    @secondary_pin = secondary_pin
    @on_time = on_time
  end
  def open_main_door
    @main_pin.on
    sleep 0.5 
    @main_pin.off
  end
  def open_secondary_door
    @secondary_pin.on
    sleep 0.5
    @secondary_pin.off
  end
end
