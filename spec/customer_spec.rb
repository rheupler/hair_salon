require('spec_helper')

describe(Customer) do
  describe(".all") do
    it("starts off empty") do
      expect(Customer.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the customer info to the database') do
      customer = Customer.new({:name => "Sam Sparks", :phone => "555-55-5555", :stylist_id => 1, :id => nil})
      customer.save()
      expect(Customer.all()).to(eq([customer]))
    end
  end

end
