class FrontierDataRenderer
end

require_relative "frontier_data_renderer/view_helper"

if defined?(Rails)
  ActionView::Base.include FrontierDataRenderer::ViewHelper
end
