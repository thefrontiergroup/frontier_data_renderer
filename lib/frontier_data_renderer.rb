class FrontierDataRenderer
  class << self
    attr_accessor :no_boolean_data_text, :no_data_class, :no_data_text, :no_data_title
  end
end

FrontierDataRenderer.no_boolean_data_text = "No"
FrontierDataRenderer.no_data_class = "text-muted"
FrontierDataRenderer.no_data_text = "N/A"
FrontierDataRenderer.no_data_title = "Not available"

require_relative "frontier_data_renderer/view_helper"

if defined?(Rails)
  ActionView::Base.include FrontierDataRenderer::ViewHelper
end
