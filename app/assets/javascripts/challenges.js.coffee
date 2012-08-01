$ ->
  view_links = $('a').filter (index) ->
    return $(this).text() == 'Show'
  view_links.click (e) ->
    e.preventDefault()
    if $(this).text() == "Show"
      $(this).text "Hide"
    else
      $(this).text "Show"
    $(this).next().slideToggle "fast"
