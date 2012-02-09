#= require_self
#= require_tree ./models
#= require_tree ./templates
#= require_tree ./views
#= require_tree ./routers

window.BPS =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  simple_format: (text) ->
    lines = text.split("\n")
    break_lines = (formatted, line) ->
      "#{formatted}<br>#{line}"
  
    _.reduce(_.rest(lines), break_lines, _.first(lines))
  