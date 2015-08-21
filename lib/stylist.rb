class Stylist
  attr_reader(:name, :id)

  def initialize(attributes)
    @name = attributes.fetch('name')
    @id = attributes.fetch('id')
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      name = stylist.fetch('name')
      id = stylist.fetch('id').to_i
      stylist << Stylist.new({:name => name, :id => id})
    end
    stylists
  end
end
