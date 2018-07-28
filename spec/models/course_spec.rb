require 'rails_helper'

RSpec.describe Course, type: :model do
  # Associations
  it { should have_many(:cohorts).dependent(:destroy) }

  # Validations
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:created_by) }
end
