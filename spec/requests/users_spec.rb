# spec/requests/users_spec.rb
require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  # create_list returns an array
  let!(:course) { create(:course) }
  # Create a cohort, assigning the course to it
  let!(:cohort) { create(:cohort, course: course) }
  # create a role
  let!(:role) { create(:role) }
  # Create test user and assign course, cohort and role to it
  let(:user) { create(:user, course: course, cohort: cohort, role: role) }

  let(:headers) { valid_headers.except('Authorization') }
  let(:valid_attributes) do
    attributes_for(:user, password_confirmation: user.password)
  end

  # User signup test suite
  describe 'POST /signup' do
    context 'when valid request' do
      before { post '/signup', params: valid_attributes.to_json, headers: headers }
      it 'creates a new user' do
        # puts valid_attributes
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Account created successfully/)
      end

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before { post '/signup', params: {}, headers: headers }

      it 'does not create a new user' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match(/Validation failed: Password can't be blank, Role must exist, Course must exist, Cohort must exist, First name can't be blank, Last name can't be blank, Email can't be blank, Password digest can't be blank/)
      end
    end
  end
end
