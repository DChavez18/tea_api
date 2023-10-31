require "rails_helper"

RSpec.describe "Cancel a subscription", type: :request do
  describe "happy path" do
    it "cancels a subscription" do
      customer = Customer.create!(first_name: "Bob", last_name: "Gu", email: "bg@gmail.com", address: "1234 Rails St")
      tea = Tea.create!(title: "Earl Grey", description: "Tea", temp: 200, brew_time: 5)
      tea2 = Tea.create!(title: "Green Tea", description: "Tea", temp: 201, brew_time: 4)
      subscription = Subscription.create!(title: "Earl Grey", price: 10.00, status: "active", frequency: 1, customer_id: customer.id, tea_id: tea.id)
      subscription2 = Subscription.create!(title: "Green Tea", price: 10.00, status: "cancelled", frequency: 1, customer_id: customer.id, tea_id: tea2.id)

      patch "/api/v1/subscriptions/#{subscription.id}/cancel"

      expect(response).to be_successful
      expect(response.status).to eq(200)

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

      expect(data[:attributes][:title]).to eq("Earl Grey")
      expect(data[:attributes][:price]).to eq(10.00)
      expect(data[:attributes][:status]).to eq("cancelled")
      expect(data[:attributes][:frequency]).to eq("monthly")
      expect(data[:attributes][:tea_id]).to eq(tea.id)
      expect(data[:attributes][:customer_id]).to eq(customer.id)

      expect(Subscription.last.status).to eq("cancelled")
    end
  end
end