##Boris Bikes

#### About

The challenge for week 1 of Makers Academy was to model the Boris Bikes cycle hire system. This was done using Ruby, and test driven with RSpec.

#### Installation

0. Clone this repo using ```$ git clone git@github.com:Wynndow/Boris-Bikes.git```
0. Move into the new directory using ```$ cd Boris-Bikes```

#### Usage

```
[1] pry(main)> load './lib/dockingstation.rb'
=> true
[2] pry(main)> docking_station = DockingStation.new
=> #<DockingStation:0x007f966d071a10 @bikes=[], @broken_bikes=[], @capacity=20>
[3] pry(main)> docking_station.release_bike
RuntimeError: Can't release bike: None available or broken
from /Users/chriswynne/Projects/Week1/Boris-Bikes/lib/dockingstation.rb:16:in `release_bike'
[4] pry(main)> bike = Bike.new
=> #<Bike:0x007f966a7dddd8 @working=true>
[5] pry(main)> docking_station.dock(bike)
=> [#<Bike:0x007f966a7dddd8 @working=true>]
[6] pry(main)> docking_station.release_bike
=> #<Bike:0x007f966a7dddd8 @working=true>
[7] pry(main)> broken_bike = Bike.new
=> #<Bike:0x007f966a705280 @working=true>
[8] pry(main)> broken_bike.report_broken
=> false
[9] pry(main)> docking_station.dock(broken_bike)
=> [#<Bike:0x007f966a705280 @working=false>]
```

#### Running tests

0. Tests are run form the command line using ```$ rspec```

