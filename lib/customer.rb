class Customer
  attr_reader(:name, :phone, :stylist_id, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @phone = attributes.fetch(:phone)
    @stylist_id = attributes.fetch(:stylist_id)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_customers = DB.exec("SELECT * FROM customers;")
    customers = []
    returned_customers.each() do |customer|
      name = customer.fetch("name")
      phone = customer.fetch("phone")
      stylist_id = customer.fetch("stylist_id")
      id = customer.fetch("id").to_i()
      customers.push(Customer.new({:name => name, :phone => phone, :stylist_id => stylist_id, :id => id}))
    end
    customers
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO customers (name, phone, stylist_id) VALUES ('#{@name}', '#{@phone}', #{@stylist_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_customer|
    self.name().==(another_customer.name()).&(self.id().==(another_customer.id()))
  end
end
