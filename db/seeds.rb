# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
customer = Customer.create(first_name: "Bob", last_name: "Gu", email: "bg@gmail.com", address: "1234 Rails St")

tea = Tea.create(:title => "Earl Grey", :description => "Tea", :temp => 200, :brew_time => 5)
tea2 = Tea.create(:title => "Green Tea", :description => "Tea", :temp => 201, :brew_time => 4)
subscription = Subscription.create(:title => "Earl Grey", :price => 10.00, :status => 0, :frequency => 1, :customer_id => customer.id, :tea_id => tea.id)
subscription2 = Subscription.create(:title => "Green Tea", :price => 10.00, :status => 1, :frequency => 1, :customer_id => customer.id, :tea_id => tea2.id)

