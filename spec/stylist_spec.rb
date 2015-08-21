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

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name)
    @id = self.id()
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = #{self.id()};")
    DB.exec("DELETE FROM customers WHERE stylist_id = #{self.id()};")
  end

  describe(".find") do
   it("returns a stylist by its ID number") do
     stylist1 = Stylist.new({:name => "Jenni", :id => nil})
     stylist1.save()
     stylist2 = Stylist.new({:name => "Tess", :id => nil})
     stylist2.save()
     expect(Stylist.find(stylist1.id())).to(eq(stylist1))
   end
 end

 describe(".find") do
   it("returns a stylist by its ID number") do
     stylist1 = Stylist.new({:name => "Becky", :id => nil})
     stylist1.save()
     stylist2 = Stylist.new({:name => "Scooter", :id => nil})
     stylist2.save()
     expect(Stylist.find(stylist1.id())).to(eq(stylist1))
   end
 end

 describe("#customers") do
   it("returns an array of customers, alphabetized by first name, for that stylist") do
     stylist1 = Stylist.new({:name => "Blamey", :id => nil})
     stylist1.save()
     customer1 = Customer.new({:name => "Peter Park", :phone => "123-55-5255", :stylist_id => stylist1.id(), :id => nil})
     customer1.save()
     customer2 = Customer.new({:name => "Jenna", :phone => "525-55-6666", :stylist_id => stylist1.id(), :id => nil})
     customer2.save()
     expect(stylist1.customers()).to(eq([customer2, customer1]))
   end
 end


end
