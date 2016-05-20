class FrontierDataRenderer
  class << self
    attr_accessor :no_data_class, :no_data_text, :no_data_title
  end
end

FrontierDataRenderer.no_data_class = "text-muted"

require_relative "frontier_data_renderer/view_helper"

if defined?(Rails)
  ActionView::Base.include FrontierDataRenderer::ViewHelper
end
