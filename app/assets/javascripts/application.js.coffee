window.bind = (vm) -> ko.applyBindings vm

$ ->
  $('#authenticate').click ->
    navigator.id.get (assertion) ->
      if assertion
        $.post '/personacallback', { assertion: assertion }, (data) ->
          window.location = '/'
