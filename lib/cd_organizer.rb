class Organizer
  attr_reader(:cd_name, :artist_name)

  @@all = []

  define_method(:initialize) do |attributes|
    @cd_name = attributes.fetch(:cd_name)
    @artist_name = attributes.fetch(:artist_name)
    @id = @@all.length().+(1)

  end

  define_singleton_method(:clear) do
    @@all = []
  end

  define_method(:id) do
    @id
  end

  define_method(:save) do
    @@all.push(self)
  end

  define_singleton_method(:all) do
    @@all
  end
end
