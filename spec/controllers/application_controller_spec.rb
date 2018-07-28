require "rails_helper"

RSpec.describe ApplicationController, type: :controller do
  # create_list returns an array
  let!(:course) { create_list(:course, 1) }
  # Create a cohort, assigning the course to it
  let!(:cohort) { create(:cohort, course: course.first) }
  # create a role
  let!(:role) { create_list(:role, 1) }
  # Create test user and assign course, cohort and role to it
  let(:user) { create(:user, course: course.first, cohort: cohort, role: role.first) }
   # set headers for authorization
  let(:headers) { { 'Authorization' => token_generator(user.id) } }
  let(:invalid_headers) { { 'Authorization' => nil } }

  describe "#authorize_request" do
    context "when auth token is passed" do
      before { allow(request).to receive(:headers).and_return(headers) }

      # private method authorize_request returns current user
      it "sets the current user" do
        # puts user.first_name
        # puts user.last_name
        # puts user.email
        # puts user.course.name
        # puts user.cohort.name
        # puts user.role.roles
        expect(subject.instance_eval { authorize_request }).to eq(user)
      end
    end

    context "when auth token is not passed" do
      before do
        allow(request).to receive(:headers).and_return(invalid_headers)
      end

      it "raises MissingToken error" do
        expect { subject.instance_eval { authorize_request } }.
          to raise_error(ExceptionHandler::MissingToken, /Missing token/)
      end
    end
  end
end
