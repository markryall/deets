window.bind = (vm) -> ko.applyBindings vm

class window.LinksViewModel
  constructor: (@data) ->
    @links = ko.observableArray(@data)
    @new_key = ko.observable()
    @new_url = ko.observable()
  destroy: (element) ->
    console.log element
  add: () ->
    @links.push([@new_key(), @new_url()])
    @new_key ''
    @new_url ''

$ ->
  $('#authenticate').click ->
    navigator.id.get (assertion) ->
      if assertion
        $.post '/personacallback', { assertion: assertion }, (data) ->
          window.location = '/'
