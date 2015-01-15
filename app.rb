require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/cd_organizer')

get('/') do
  @all_cdes = Organizer.all()
  erb(:index)
end

post('/collection') do
  @artist_name = params.fetch("artist name")
  @album_name = params.fetch("album name")
  cd_hash = {:artist_name => @artist_name, :cd_name => @album_name}
  cd = Organizer.new(cd_hash)
  cd.save()
  @id = cd.id()
  @all_cdes = Organizer.all()
  erb(:index)
end

post('/search') do
  @search_artist = params.fetch("search artist")
  @search_album = params.fetch("search album")
  @search_id = params.fetch("search id")
  erb(:index)
end
