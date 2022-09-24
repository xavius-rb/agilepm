
module ApplicationHelper
  def nav_link_class(controller)
    "nav-link #{nav_link_active?(controller) ? 'active' : ''}"
  end

  def nav_link_active?(controller)
    params[:controller] == controller.to_s
  end
end
