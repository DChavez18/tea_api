require "rails_helper"

RSpec.describe "Create a subscription for a customer", type: :request do
  describe "happy path" do
    it "creates a subscription" do
      customer = Customer.create!(first_name: "Bob", last_name: "Gu", email: "bg@gmail.com", address: "1234 Rails St")
      tea = Tea.create!(title: "Earl Grey", description: "Tea", temp: 200, brew_time: 5)
      tea2 = Tea.create!(title: "Green Tea", description: "Tea", temp: 201, brew_time: 4)

      post "/api/v1/customers/#{customer.id}/subscriptions", params: {title: "Morning Time", price: 15.99, status: "active", frequency: "weekly", customer_id: customer.id, tea_id: tea.id}

      expect(response).to be_successful

      response_json = JSON.parse(response.body, symbolize_names: true)

      expect(response_json).to be_a(Hash)
      expect(response_json).to have_key(:data)

      data = response_json[:data]

      expect(data).to be_a(Hash)
      expect(data).to have_key(:id)
      expect(data).to have_key(:type)
      expect(data[:type]).to eq("subscription")
      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_a(Hash)
      
      expect(data[:attributes][:title]).to eq("Morning Time")
      expect(data[:attributes][:price]).to eq(15.99)
      expect(data[:attributes][:status]).to eq("active")
      expect(data[:attributes][:frequency]).to eq("weekly")
      expect(data[:attributes][:tea_id]).to eq(tea.id)
      expect(data[:attributes][:customer_id]).to eq(customer.id)

      expect(Subscription.last.title).to eq("Morning Time")
    end
  end

  describe "sad path" do
    it "returns an error if a required field is missing" do
      customer = Customer.create!(first_name: "Bob", last_name: "Gu", email: "bg@gmail.com", address: "1234 Rails St")
      tea = Tea.create!(title: "Earl Grey", description: "Tea", temp: 200, brew_time: 5)
      tea2 = Tea.create!(title: "Green Tea", description: "Tea", temp: 201, brew_time: 4)
      
      post "/api/v1/customers/#{customer.id}/subscriptions", params: {valid_subscription: {title: "Morning Time", price: 15.99, status: "active", frequency: "weekly", customer_id: customer.id}}
    end
  end
end