require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it { should validate_presence_of(:asunto) }
end
