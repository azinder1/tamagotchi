require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/tamagotchi')
require('pry')

get('/') do
  erb(:index)
end


post('/make_tamagotchi') do
  name = params.fetch('make_tamagotchi')
  new_tamagotchi = Tamagotchi.new(name)
  @tamagotchi = new_tamagotchi
  @tamagotchi.save_tamagotchi
  erb(:output)
end

get('/make_tamagotchi') do
  erb(:output)
end

get('/check') do
  @tamagotchi = Tamagotchi.get_tamagotchi
  @tamagotchi.time_passes(0)
  if @tamagotchi.is_alive?
    erb(:output)
  else
    erb(:dead)
  end
end

get('/feed') do
  @tamagotchi = Tamagotchi.get_tamagotchi
  @tamagotchi.set_food_level(1)
  @tamagotchi.timers[0]
  erb(:output)
end

get('/sleep') do
  @tamagotchi = Tamagotchi.get_tamagotchi
  @tamagotchi.set_sleep_level(1)
  @tamagotchi.timers[1]
  erb(:output)
end

get('/activity') do
  @tamagotchi = Tamagotchi.get_tamagotchi
  @tamagotchi.set_activity_level(1)
  @tamagotchi.timers[2]
  erb(:output)
end
