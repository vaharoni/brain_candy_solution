module ApplicationHelper
  def home_link
    return nil if controller_name == "home"
    link_to("Home", :root) + " | "
  end
end
