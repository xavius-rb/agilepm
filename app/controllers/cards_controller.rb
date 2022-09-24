class CardsController < ApplicationController
  include Xavius::Controllers::Base

  private
  def resource_params
    params.require(:card).permit(:summary).with_defaults(
      project_id: params[:project_id],
      state: "to_do"
    )
  end

  def find_resource
    if params[:id]
      resource_class.find_by!(code: params[:id])
    else
      resource_class.new(project: project)
    end
  end

  helper_method def project
    @project ||= Project.find(params[:project_id]) if params[:project_id]
  end
end
