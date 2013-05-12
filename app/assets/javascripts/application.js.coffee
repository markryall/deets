links_view_model = (data) ->
  links = ko.observableArray data
  new_key = ko.observable()
  new_url = ko.observable()
  add = () ->
    links.push [new_key(), new_url()]
    new_key ''
    new_url ''
    $('#new_key').focus()

  links: links,
  new_key: new_key,
  new_url: new_url,
  add: add,
  keyup: (that, e) -> add() if e.keyCode == 13,
  destroy: () -> links.remove this

window.bind = (data) ->
  vm = links_view_model data
  ko.applyBindings vm

$ ->
  $('#authenticate').click ->
    navigator.id.get (assertion) ->
      if assertion
        $.post '/personacallback', { assertion: assertion }, (data) ->
          window.location = '/'
