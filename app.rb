require('sinatra')
require('sinatra/reloader')
require('./lib/animal')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
    20.times do
        Animal.new
    end
    @animals = Animal.animal_info
    erb(:animals)
end

post('/') do
    @animals = Animal.search_by(:name, params[:search])
    erb(:animals)
end
