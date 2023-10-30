require "rails_helper"

RSpec.describe "Get all subscriptions for a customer", type: :request do
  describe "happy path" do
    it "returns all subscriptions" do
      customer = Customer.create!(first_name: "Bob", last_name: "Gu", email: "bg@gmail.com", address: "1234 Rails St")
      tea = Tea.create!(title: "Earl Grey", description: "Tea", temp: 200, brew_time: 5)
      tea2 = Tea.create!(title: "Green Tea", description: "Tea", temp: 201, brew_time: 4)
      subscription = Subscription.create!(title: "Earl Grey", price: 10.00, status: 0, frequency: 1, customer_id: customer.id, tea_id: tea.id)
      subscription2 = Subscription.create!(title: "Green Tea", price: 10.00, status: 0, frequency: 1, customer_id: customer.id, tea_id: tea2.id)

      get "/api/v1/customers/#{customer.id}/subscriptions"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      subscriptions = JSON.parse(response.body, symbolize_names: true)

      expect(subscriptions).to be_a(Hash)
      expect(subscriptions).to have_key(:data)
      expect(subscriptions[:data]).to be_an(Array)
      expect(subscriptions[:data].count).to eq(2)
      expect(subscriptions[:data][0]).to have_key(:id)
      expect(subscriptions[:data][0][:id]).to be_a(String)
      expect(subscriptions[:data][0]).to have_key(:type)
      expect(subscriptions[:data][0][:type]).to be_a(String)
      expect(subscriptions[:data][0]).to have_key(:attributes)
      expect(subscriptions[:data][0][:attributes]).to be_a(Hash)
      expect(subscriptions[:data][0][:attributes]).to have_key(:title)
      expect(subscriptions[:data][0][:attributes][:title]).to be_a(String)
      expect(subscriptions[:data][0][:attributes]).to have_key(:price)
      expect(subscriptions[:data][0][:attributes][:price]).to be_a(Float)
      expect(subscriptions[:data][0][:attributes]).to have_key(:status)
      expect(subscriptions[:data][0][:attributes][:status]).to be_a(Integer)
      expect(subscriptions[:data][0][:attributes]).to have_key(:frequency)
      expect(subscriptions[:data][0][:attributes][:frequency]).to be_a(Integer)
      expect(subscriptions[:data][0][:attributes]).to have_key(:customer_id)
      expect(subscriptions[:data][0][:attributes][:customer_id]).to be_a(Integer)
      expect(subscriptions[:data][0][:attributes]).to have_key(:tea_id)
      expect(subscriptions[:data][0][:attributes][:tea_id]).to be_a(Integer)
    end
  end
end

