# Initialize Admin related functions here

init_navstate = ->
  Cookies.set('nav_state', true) unless Cookies.get('nav_state')
  unless Boolean(Cookies.get('nav_state') == 'true')
    Cookies.set('nav_state', false)
    $('body').attr('class', 'nav-sm')

  $('body').on 'click', '#menu_toggle', ->
    Cookies.set('nav_state', !Boolean(Cookies.get('nav_state') == 'true'))


init_datatable = ->
  # TODO: page specific init of dt with own options
  # {
  #   "paging":    false,
  #   "ordering":  false,
  #   "info":      false,
  #   "searching": false
  # }
  $('.table').dataTable()

jQuery ->
  # load sidenav state
  init_navstate()

  # initialize datatables
  init_datatable()
