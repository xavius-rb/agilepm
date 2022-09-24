class ProjectsController < ApplicationController
  include Xavius::Controllers::Base

  private
  def resource_params
    params.require(:project).permit(:name)
  end
end
