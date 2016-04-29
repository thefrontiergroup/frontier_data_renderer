module FrontierDataRenderer::ViewHelper

 def render_data(value, type=:string, opts={})
    if value.present?
      format_value(value, type, opts)
    else
      no_data_message
    end
  end

private

  def format_value(value, type, opts)
    case type.to_sym
    when :datetime
      time_tag(value.to_datetime, opts.reverse_merge(format: :default))
    when :date
      time_tag(value.to_date, opts.reverse_merge(format: :default))
    else
      value
    end
  end

  def no_data_message
    content_tag(:span, "N/A", class: "text-muted")
  end

end
