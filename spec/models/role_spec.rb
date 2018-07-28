require 'rails_helper'

RSpec.describe Role, type: :model do
  # Associations
  it { should have_many(:users) }

  # Validations
  it { should validate_presence_of(:roles) }

end
