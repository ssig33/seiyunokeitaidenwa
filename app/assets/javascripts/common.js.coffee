window.router = (controller, action, func)->
  func() if controller == $('#controller').text() and action == $('#action').text()

