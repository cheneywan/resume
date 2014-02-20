collapse = $ ".collapse"
toggle = $ ".toggle a"
toggle.on "click", (event) ->
  collapse.toggleClass "in"
  if toggle.html() is '展开更多...'
    toggle.html "收起"
  else
    toggle.html "展开更多..."
