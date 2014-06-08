class @Dispatcher
  constructor: ->
    @$output = $('#output')
    url = "localhost:3000/websocket"

    @dispatcher = new WebSocketRails(url, true)
    @_bindEvents()
    @_checkForScripting()

  # Scroll down to accomodate new output
  reScroll: ->
    @$output.animate
      scrollTop: @$output.height()

  # Limit scroll buffer
  pruneParagraphs: ->
    extra_p_count = @$output.find('p').length - 20
    if extra_p_count > 0
      @$output.find('p:first-of-type').remove() for [1..extra_p_count]
    while @$output.find('.hr:first-child').length
      @$output.find('.hr:first-child').remove()

  # Receive broadcasts
  _bindEvents: =>
    @dispatcher.bind 'append_message', @_appendMessage

  # Execute an action when a binding is activated
  _appendMessage: (messages) =>
    for message in messages
      if message
        @$output.append $("<p>#{message}</p>")
    @$output.append $("<div class='hr'></div>")
    @pruneParagraphs()
    @reScroll()

  _checkForScripting: ->
    setInterval (->
      window.ROOM.dispatcher.dispatcher.trigger 'check_scripts'
    ), 3000

