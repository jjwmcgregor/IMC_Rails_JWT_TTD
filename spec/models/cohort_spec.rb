require 'rails_helper'

RSpec.describe Cohort, type: :model do
  # Associations
  it { should belong_to(:course) }

  # Validations
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }
end
