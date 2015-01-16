require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/cd_organizer')

get('/') do
  @all_cdes = Organizer.all()
  erb(:index)
end

post('/collection') do
  @artist_add = params.fetch("artist_name")
  @album_add = params.fetch("album_name")
  cd_hash = {:artist_name => @artist_add, :cd_name => @album_add}
  cd = Organizer.new(cd_hash)
  cd.save()
  @id = cd.id()
  @all_cdes = Organizer.all()
  erb(:index)
end

post('/library') do
  @all_cdes = Organizer.all()
  @search_artist = params.fetch("search_artist")
  @search_album = params.fetch("search_album")
  @search_id = params.fetch("search_id").to_i
  @result_id = Organizer.search_id(@search_id)
  @result_artist = Organizer.search_artist(@search_artist)
  @result_album = Organizer.search_album(@search_album)
  erb(:library)
end
