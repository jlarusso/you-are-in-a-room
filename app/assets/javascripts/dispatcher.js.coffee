class @Dispatcher
  constructor: ->
    @$output = $('#output')
    url = "localhost:3000/websocket"

    @dispatcher = new WebSocketRails(url, true)
    @_bindEvents()

  # Scroll down to accomodate new output
  reScroll: ->
    @$output.animate
      scrollTop: @$output.height()

  # Limit scroll buffer
  pruneParagraphs: ->
    extra_count = @$output.find('p').length - 20
    if extra_count > 0
      @$output.find('p:first-child').remove() for [1..extra_count]

  # Events are triggered on the dispatcher from the websockets connection
  _bindEvents: =>
    @dispatcher.bind 'append_message', @_appendMessage

  # Execute an action when a binding is activated
  _appendMessage: (messages) =>
    for message in messages
      @$output.append $("<p>#{message}</p>")
    @pruneParagraphs()
    @reScroll()

