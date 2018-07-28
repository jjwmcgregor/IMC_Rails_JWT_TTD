require 'rails_helper'

RSpec.describe User, type: :model do
  # Associations
  it { should belong_to(:role) }
  it { should belong_to(:course) }
  it { should belong_to(:cohort) }

  # Validations
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password_digest) }

end
