class @Dispatcher
  constructor: ->
    @$container = $('#output')
    url = "localhost:3000/websocket"

    @connection = new WebSocketRails(url, true)
    @_bindEvents()

  # Bindings receive messages from a websockets connection
  _bindEvents: =>
    @connection.bind 'current_room', @_receiveCurrentRoom

  # Events execute an action when a binding is activated
  _receiveCurrentRoom: (message) =>
    @$container.append("<p>#{message.output}</p>")

