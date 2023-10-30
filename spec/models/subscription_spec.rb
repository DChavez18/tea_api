require "rails_helper"

RSpec.describe Subscription, type: :model do
  describe "relationships" do
    it {should belong_to :customer}
    it {should belong_to :tea}
  end

  describe "enums" do
    it {should define_enum_for(:status).with_values([:active, :cancelled])}
    it {should define_enum_for(:frequency).with_values([:weekly, :monthly])}
  end
end