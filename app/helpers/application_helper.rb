module ApplicationHelper

  def active_link_to (nav_link, control, action, url, style)
    if controller_name == control && action_name == action
      return link_to nav_link, url, id: style
    else
      return link_to nav_link, url, class: style
    end
  end
end
