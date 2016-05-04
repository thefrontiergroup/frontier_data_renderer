# Frontier Data Renderer

Frontier Data Renderer provides a view helper to make rendering data on profile views or in tables easier.

## Installation

```ruby
gem "frontier_data_renderer", github: "thefrontiergroup/frontier_data_renderer"
```

## Usage

In your view, use `render_data` to show data

```ruby
# When rendering a nil object, no matter what type you'll get
render_data(nil) # => "<span class="text-muted">N/A</span>"

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
```

## Overriding default classes on N/A message

You can override `FrontierDataRenderer.no_data_class` to provide your own CSS classes to be rendered on the 'N/A' span.

You might want to create an initializer to do this. Example:

```ruby
# in config/initializers/frontier_data_renderer.rb

FrontierDataRenderer.no_data_class = "Jordan Rules" # Single class
FrontierDataRenderer.no_data_class = ["Jordan", "Rules"] # Multiple classes
```
