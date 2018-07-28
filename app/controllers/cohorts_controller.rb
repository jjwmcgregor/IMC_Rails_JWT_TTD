class CohortsController < ApplicationController
  before_action :set_course
  before_action :set_course_cohort, only: [:show, :update, :destroy]

  # GET /cohorts/:cohort_id/cohorts
  def index
    json_response(@course.cohorts)
  end

  # GET /cohorts/:cohort_id/cohorts/:id
  def show
    json_response(@cohort)
  end

  # POST /cohorts/:cohort_id/cohorts
  def create
    @course.cohorts.create!(cohort_params)
    json_response(@course, :created)
  end

  # PUT /cohorts/:cohort_id/cohorts/:id
  def update
    @cohort.update(cohort_params)
    head :no_content
  end

  # DELETE /cohorts/:cohort_id/cohorts/:id
  def destroy
    @cohort.destroy
    head :no_content
  end

  private

  def cohort_params
    params.permit(:name, :start_date, :end_date)
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_course_cohort
    @cohort = @course.cohorts.find_by!(id: params[:id]) if @course
  end

end
