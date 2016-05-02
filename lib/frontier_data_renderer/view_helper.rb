module FrontierDataRenderer::ViewHelper

 def render_data(value, type=:string, opts={})
    if value.present?
      format_value(value, type, opts)
    else
      no_data_message(type)
    end
  end

private

  def format_value(value, type, opts)
    case type.to_sym
    when :boolean
      value ? "Yes" : no_data_message(:boolean)
    when :datetime
      time_tag(value.to_datetime, opts.reverse_merge(format: :default))
    when :date
      time_tag(value.to_date, opts.reverse_merge(format: :default))
    when :percentage
      number_to_percentage(value, opts.reverse_merge(precision: 0))
    else
      value
    end
  end

  def no_data_message(type)
    content_tag(:span, no_data_text(type), class: "text-muted")
  end

  def no_data_text(type)
    if type == :boolean
      "No"
    else
      "N/A"
    end
  end

end
