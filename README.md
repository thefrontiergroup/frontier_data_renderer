# Frontier Data Renderer

Frontier Data Renderer provides a view helper to make rendering data on profile views or in tables easier.

## Installation

```ruby
gem "frontier_data_renderer", github: "thefrontiergroup/frontier_data_renderer"
```

## Usage

In your view, use `render_data` to show data

```ruby
# When rendering a nil object, for all types except for boolean you'll get:
render_data(nil) # => "<abbr class="text-muted" title="Not available">N/A</abbr>"

# You can override the class by passing the 'no_data_class' option:
render_data(nil, :string, {no_data_class: "yolo"}) # => "<abbr class="yolo" title="Not available">N/A</abbr>"

# You can override the message provided by passing the 'no_data_text' option:
render_data(nil, :string, {no_data_text: "-"}) # => "<abbr class="text-muted" title="Not available">-</abbr>"

# You can override the title of the abbreviation by passing the 'no_data_title' option:
render_data(nil, :string, {no_data_title: "Not applicable"}) # => "<abbr class="text-muted" title="Not applicable">N/A</abbr>"

# Boolean
render_data(true, :boolean) # => "Yes"
render_data(false, :boolean) # => "<span class="text-muted">No</span>"
render_data(nil, :boolean) # => "<span class="text-muted">No</span>"

# Currency
render_data(74.8, :currency) # => "$74.80"
render_data(74.8, :currency, precision: 1) # => "$74.8"

# Date
render_data(Date.new(2016, 4, 29), :date) # => "2016-04-29"
render_data(Date.new(2016, 4, 29), :date, {format: :my_format}) # => "29/4/2016"

# DateTime
render_data(DateDateTime.new(2016, 4, 29, 17, 30), :date) # => "Fri, 29 April 2016 17:30:00 +0000"
render_data(DateTime.new(2016, 4, 29, 17, 30), :date, {format: :my_format}) # => "29/4/2016 5:30PM"

# Percentage
render_data(55, :percentage) # => "55%"
render_data(55, :percentage, precision: 0) # => "55%"
render_data(55, :percentage, precision: 1) # => "55.0%"

# Strings
render_data("Jordan") # => "Jordan"

# Text
render_data("Jordan Rules!", :text) # => "Jordan Rules!"
render_data("Jordan Rules!", :text, length: 6) # => "<span title='Jordan Rules!'>Jor...</span>"
```

## Globally overriding empty data classes, messages, and titles

You can override `FrontierDataRenderer.no_data_class` to provide your own CSS classes to be rendered on the 'N/A' `abbr` HTML element.

You might want to create an initializer to do this. Example:

```ruby
# in config/initializers/frontier_data_renderer.rb

FrontierDataRenderer.no_data_class = "text-quiet" # Single class
# => "<abbr class="text-quiet" title="Not available">N/A</abbr>
FrontierDataRenderer.no_data_class = ["text-quiet", "data-na"] # Multiple classes
# => "<abbr class="text-quiet data-na" title="Not available">N/A</abbr>
```

Local definitions via options will take precedence over global definitions
.
