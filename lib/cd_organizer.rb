class Organizer
  attr_reader(:cd_name, :artist_name)

  @@all = []
  @@counter = 1

  define_method(:initialize) do |attributes|
    @cd_name = attributes.fetch(:cd_name)
    @artist_name = attributes.fetch(:artist_name)
    @id = @@counter

  end

  define_singleton_method(:clear) do
    @@all = []
    @@counter = 1
  end

  define_method(:id) do
    @id
  end

  define_method(:save) do
    @@all.push(self)
    @@counter = @@counter.+(1)
  end

  define_singleton_method(:all) do
    @@all
  end

  define_singleton_method(:search_id?) do |search_item|
    cd_list = []
    @@all.each() do |cd|
      if cd.id() == search_item
        cd_list.push(cd)
      end
    end
    return cd_list
  end
end
