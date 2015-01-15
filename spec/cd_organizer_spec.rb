require('rspec')
require('cd_organizer')

describe(Organizer) do
  before() do
    Organizer.clear()
  end

  describe("#cd_name") do
    it("tests the function to see if we can pass in a cd name") do
      test_cd = Organizer.new({:cd_name => "Christmas songs", :artist_name => "Various Artists"})
      expect(test_cd.cd_name()).to(eq("Christmas songs"))
    end
  end

  describe("#artist_name") do
    it("tests the function to see if we can pass in a artist name") do
      test_cd = Organizer.new({:cd_name => "Christmas songs", :artist_name => "Various Artists"})
      expect(test_cd.artist_name()).to(eq("Various Artists"))
    end
  end

  describe("#save") do
    it("test the save function of the attributes inputed") do
      test_cd = Organizer.new({:cd_name =>"Christmas songs", :artist_name => "Various Artists"})
      test_cd.save()
      expect(Organizer.all()).to(eq([test_cd]))
    end
  end

  describe("#clear") do
    it("test the clear function to see if it clears the class") do
      test_cd = Organizer.new({:cd_name =>"Christmas songs", :artist_name => "Various Artists"})
      test_cd.save()
      Organizer.clear()
      expect(Organizer.all()).to(eq([]))
    end
  end

  describe(".search_id") do
    it("tests the search function to be able to search for cd") do
      test_cd = Organizer.new({:cd_name =>"Christmas songs", :artist_name => "Various Artists"})
      test_cd.save()
      test_cd_2 = Organizer.new({:cd_name => "Halloween music", :artist_name => "Various Artists"})
      test_cd_2.save()
      expect(Organizer.search_id(1)).to(eq(test_cd))
    end
  end

  describe(".search_album") do
    it("tests the search function to be able to search for album titles") do
      test_cd = Organizer.new({:cd_name =>"Christmas songs", :artist_name => "Various Artists"})
      test_cd.save()
      test_cd_2 = Organizer.new({:cd_name => "Halloween music", :artist_name => "Various Artists"})
      test_cd_2.save()
      expect(Organizer.search_album("Halloween music")).to(eq([test_cd_2]))
    end
  end

  describe(".search_artist") do
    it("tests the search function to be able to search for album titles") do
      test_cd = Organizer.new({:cd_name =>"Christmas songs", :artist_name => "Various Artists"})
      test_cd.save()
      test_cd_2 = Organizer.new({:cd_name => "Halloween music", :artist_name => "Various Artists"})
      test_cd_2.save()
      expect(Organizer.search_artist("Various Artists")).to(eq([test_cd, test_cd_2]))
    end
  end

end
