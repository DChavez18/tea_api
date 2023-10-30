require "rails_helper"

RSpec.describe "Get all subscriptions for a customer", type: :request do
  describe "happy path" do
    it "returns all subscriptions" do
      customer = Customer.create!(first_name: "Bob", last_name: "Gu", email: "bg@gmail.com", address: "1234 Rails St")
      tea = Tea.create!(title: "Earl Grey", description: "Tea", temp: 200, brew_time: 5)
      tea2 = Tea.create!(title: "Green Tea", description: "Tea", temp: 201, brew_time: 4)
      subscription = Subscription.create!(title: "Earl Grey", price: 10.00, status: 0, frequency: 1, customer_id: customer.id, tea_id: tea.id)
      subscription2 = Subscription.create!(title: "Green Tea", price: 10.00, status: 1, frequency: 1, customer_id: customer.id, tea_id: tea2.id)

      get "/api/v1/customers/#{customer.id}/subscriptions"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      response_json = JSON.parse(response.body, symbolize_names: true)

      expect(response_json).to be_a(Hash)
      expect(response_json).to have_key(:data)

      data = response_json[:data]
      expect(data).to be_an(Array)
      expect(data.count).to eq(2)
      expect(data[0]).to have_key(:id)
      expect(data[0]).to have_key(:type)
      expect(data[0][:type]).to eq("subscription")
      expect(data[0]).to have_key(:attributes)
      expect(data[0][:attributes]).to be_a(Hash)

      expect(data[0][:attributes][:title]).to eq("Earl Grey")
      expect(data[0][:attributes][:price]).to eq(10.00)
      expect(data[0][:attributes][:status]).to eq("active")
      expect(data[0][:attributes][:frequency]).to eq("monthly")
      expect(data[0][:attributes][:tea_id]).to eq(tea.id)
      expect(data[0][:attributes][:customer_id]).to eq(customer.id)
    end
  end
end

