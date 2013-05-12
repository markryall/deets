links_view_model = (data) ->
  links = ko.observableArray data
  new_key = ko.observable()
  new_url = ko.observable()
  destroy = () -> links.remove this
  add = () ->
    links.push [new_key(), new_url()]
    new_key ''
    new_url ''
  links: links,
  new_key: new_key,
  new_url: new_url
  add: add,
  destroy: destroy

window.bind = (data) ->
  vm = links_view_model data
  ko.applyBindings vm

$ ->
  $('#authenticate').click ->
    navigator.id.get (assertion) ->
      if assertion
        $.post '/personacallback', { assertion: assertion }, (data) ->
          window.location = '/'
