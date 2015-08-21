require('spec_helper')

describe(Stylist) do
  describe(".all") do
    it("starts off empty") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the stylist info to the database') do
      stylist = Stylist.new({:name => "Uncle Buck", :id => nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe('#==') do
    it("is the same stylist if it has the same  name and id") do
      stylist1 = Stylist.new({:name => "Marty", :id => nil})
      stylist2 = Stylist.new({:name => "Marty", :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end


end
