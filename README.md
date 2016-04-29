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
render_data(nil) # => <span class="text-muted">N/A</span>

# Date
render_data(Date.new(2016, 4, 29), :date) # => 2016-04-29
render_data(Date.new(2016, 4, 29), :date, {format: :my_format}) # => "29/4/2016"

# DateTime
render_data(DateDateTime.new(2016, 4, 29, 17, 30), :date) # => Fri, 29 April 2016 17:30:00 +0000
render_data(DateTime.new(2016, 4, 29, 17, 30), :date, {format: :my_format}) # => "29/4/2016 5:30PM"

# Percentage
render_data(55, :percentage) # => 55%
render_data(55, :percentage, precision: 0) # => 55%
render_data(55, :percentage, precision: 1) # => 55.0%

# Strings
render_data("Jordan") # => "Jordan"
