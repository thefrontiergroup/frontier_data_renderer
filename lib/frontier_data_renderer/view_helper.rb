module FrontierDataRenderer::ViewHelper

 def render_data(value, type=:string, options={})
    if value.present?
      format_value(value, type, options)
    else
      no_data_markup(type, options)
    end
  end

private

  def format_value(value, type, options)
    case type.to_sym
    when :boolean
      value ? "Yes" : no_data_markup(:boolean)
    when :currency
      number_to_currency(value, options)
    when :datetime
      time_tag(value.to_datetime, options.reverse_merge(format: :default))
    when :date
      time_tag(value.to_date, options.reverse_merge(format: :default))
    when :percentage
      number_to_percentage(value, options.reverse_merge(precision: 0))
    when :text
      if options[:length].present?
        content_tag(:span, truncate(value, options), title: value)
      else
        value
      end
    else
      value
    end
  end

  def no_data_markup(type, options)
    if type == :boolean
      content_tag(:span, options[:no_content_text] || "No", class: FrontierDataRenderer.no_data_class)
    else
      content_tag(:abbr, options[:no_content_text] || "N/A", class: FrontierDataRenderer.no_data_class, title: options[:no_content_title] || "Not available")
    end
  end

end
