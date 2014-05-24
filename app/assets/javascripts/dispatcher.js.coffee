class @Dispatcher
  constructor: ->
    url = "localhost:3000/websocket"

    @connection = new WebSocketRails(url, true)
    @_bindEvents()

  # Bindings receive messages from a websockets connection
  _bindEvents: =>
    @connection.bind 'send_output', @_sendOutput

  # Events execute an action when a binding is activated
  _sendOutput: (message) =>
    console.log message

