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

  def no_data_class(options)
    options[:no_data_class] || FrontierDataRenderer.no_data_class
  end

  def no_data_markup(type, options)
    if type == :boolean
      content_tag(:span, options[:no_data_text] || FrontierDataRenderer.no_boolean_data_text, class: no_data_class(options))
    else
      content_tag(:abbr, options[:no_data_text] || FrontierDataRenderer.no_data_text, {
        class: no_data_class(options),
        title: options[:no_data_title] || FrontierDataRenderer.no_data_title
      })
    end
  end

end
