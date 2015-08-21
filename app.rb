require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/stylist.rb')
require('./lib/customer.rb')
require('pg')

DB = PG.connect({:dbname => "hair_salon"})

get('/') do
  @stylists = Stylist.all()
  erb(:index)
end

get("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist)
end

get("/stylists/:id/edit") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:edit_stylist)
end

patch("/stylists/:id") do
  name = params.fetch("name")
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:name => name})
  erb(:stylist)
end

delete("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:index)
end

post("/stylist") do
 name = params.fetch("name")
 stylist = Stylist.new({:name => name, :id => nil})
 stylist.save()
 @stylists = Stylist.all()
 erb(:index)
end

post("/customers") do
  name = params.fetch("customer")
  phone = params.fetch("phone")
  stylist_id = params.fetch("stylist_id").to_i()
  customer = Customer.new({:name => name, :phone => phone, :stylist_id => stylist_id, :id => nil})
  customer.save()
  @stylist = Stylist.find(stylist_id)
  erb(:stylist)
end
