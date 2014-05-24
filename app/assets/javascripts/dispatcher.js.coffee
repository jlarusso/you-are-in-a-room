class @Dispatcher
  constructor: ->
    @$container = $('#output')
    url = "localhost:3000/websocket"

    @dispatcher = new WebSocketRails(url, true)
    @_bindEvents()

  # Events are triggered on the dispatcher from the websockets connection
  _bindEvents: =>
    @dispatcher.bind 'append_message', @_appendMessage

  # Execute an action when a binding is activated
  _appendMessage: (message) =>
    @$container.append("<p>#{message}</p>")

