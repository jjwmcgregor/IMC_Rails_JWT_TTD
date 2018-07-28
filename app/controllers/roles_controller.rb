class RolesController < ApplicationController
  before_action :set_role, only: [:show, :update, :destroy]

  # GET /roles
  def index
    @roles = Role.all
    json_response(@roles)
  end

  # POST /roles
  def create
    @role = Role.create!(role_params)
    json_response(@role, :created)
  end

  # GET /roles/:id
  def show
    json_response(@role)
  end

  # PUT /roles/:id
  def update
    @role.update(role_params)
    head :no_content
  end

  # DELETE /roles/:id
  def destroy
    @role.destroy
    head :no_content
  end

  private

  def role_params
    # whitelist params
    params.permit(:roles)
  end

  def set_role
    @role = Role.find(params[:id])
  end

end
