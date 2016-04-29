# Frontier Data Renderer

Frontier Data Renderer provides a view helper to make rendering data on profile views or in tables easier.

## Installation

gem 'frontier_data_renderer', github: "thefrontiergroup/frontier_data_renderer"

## Usage

In your view, use `render_data` to show data

```ruby
# Date
render_data(Date.new(2016, 4, 29), :date, {format: :my_format}) # => "29/4/2016"

# DateTime
render_data(DateTime.new(2016, 4, 29, 17, 30), :date, {format: :my_format}) # => "29/4/2016 5:30PM"

# Strings
render_data("Jordan") # => "Jordan"
render_data(nil)      # => <span class="text-muted">N/A</span>

