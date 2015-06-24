require './lib/city_temperature_reporter'

describe CityTemperatureReporter do

  it 'requests its current temperature' do
    #SETUP
    weatherman = double :weatherman
    new_york   = CityTemperatureReporter.new('New York', weatherman)
    #EXPECTATION ABOUT THE FUTURE
    expect(weatherman).to receive(:get_temperature).with('New York')
    #ACTION
    new_york.temperature

  end

  it 'reports its current temperature' do
    #SETUP
    weatherman = double :weatherman
    allow(weatherman).to receive(:get_temperature).with('Seoul').and_return('29')
    seoul      = CityTemperatureReporter.new('Seoul', weatherman)
    #EXPECTATION
    expect(seoul.temperature).to eq '29'

  end
end
