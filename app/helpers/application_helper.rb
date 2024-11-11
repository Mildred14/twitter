# frozen_string_literal: true

module ApplicationHelper
  def render_icon(icon, classes: nil, fill: nil, width: nil, height: nil)
    classes ||= ''
    fill ||= '#676767'
    width ||= ''
    height ||= ''
    render partial: "icons/#{icon}",
           locals: { size_width: width, classes: classes, fill_value: fill, size_height: height }
  end
end
