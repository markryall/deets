$.ajaxSetup
  beforeSend: (xhr) ->
    xhr.setRequestHeader 'X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')

links_view_model = (data) ->
  links = ko.observableArray data
  new_key = ko.observable()
  new_url = ko.observable()

  add = () ->
    $.ajax
      type: 'post',
      url: '/add_link.json',
      data:
        new_key: new_key(),
        new_url: new_url()
      success: (data) ->
        links.push [new_key(), new_url()]
        new_key ''
        new_url ''
        $('#new_key').focus()

  destroy = () ->
    that = this
    $.ajax
      type: 'post',
      url: '/remove_link.json',
      data:
        key: that[0]
      success:
        links.remove that

  links: links,
  new_key: new_key,
  new_url: new_url,
  add: add,
  destroy: destroy,
  keyup: (that, e) -> add() if e.keyCode == 13

window.bind = (data) ->
  vm = links_view_model data
  ko.applyBindings vm

$ ->
  $('#authenticate').click ->
    navigator.id.get (assertion) ->
      if assertion
        $.post '/personacallback', { assertion: assertion }, (data) ->
          window.location = '/'
