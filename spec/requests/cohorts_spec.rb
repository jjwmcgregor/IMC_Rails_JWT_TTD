require 'rails_helper'

RSpec.describe 'Cohorts API', type: :request do
  # Initialize the test data
  let!(:course) { create(:course) }
  let!(:cohorts) { create_list(:cohort, 20, course_id: course.id) }
  let(:course_id) { course.id }
  let(:id) { cohorts.first.id }

  # Test suite for GET /courses/:course_id/cohorts
  describe 'GET /courses/:course_id/cohorts' do
    before { get "/courses/#{course_id}/cohorts" }

    context 'when course exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all course cohorts' do
        expect(json.size).to eq(20)
      end
    end

    context 'when course does not exist' do
      let(:course_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Course/)
      end
    end
  end

  # Test suite for GET /courses/:course_id/cohorts/:id
  describe 'GET /courses/:course_id/cohorts/:id' do
    before { get "/courses/#{course_id}/cohorts/#{id}" }

    context 'when course cohort exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the cohort' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when course cohort does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Cohort/)
      end
    end
  end

  # Test suite for PUT /courses/:course_id/cohorts
  describe 'POST /courses/:course_id/cohorts' do
    let(:valid_attributes) { { name: 'Visit Narnia', start_date: '1900/01/01', end_date: '1912/01/01' } }

    context 'when request attributes are valid' do
      before { post "/courses/#{course_id}/cohorts", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/courses/#{course_id}/cohorts", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /courses/:course_id/cohorts/:id
  describe 'PUT /courses/:course_id/cohorts/:id' do
    let(:valid_attributes) { { name: 'Mozart' } }

    before { put "/courses/#{course_id}/cohorts/#{id}", params: valid_attributes }

    context 'when cohort exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the cohort' do
        updated_cohort = Cohort.find(id)
        expect(updated_cohort.name).to match(/Mozart/)
      end
    end

    context 'when the cohort does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Cohort/)
      end
    end
  end

  # Test suite for DELETE /courses/:id
  describe 'DELETE /courses/:id' do
    before { delete "/courses/#{course_id}/cohorts/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end
