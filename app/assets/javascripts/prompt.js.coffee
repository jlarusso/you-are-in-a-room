class @Prompt
  constructor: ->
    @$container = $('#prompt')
    @$input = @$container.find('input')

    @$input.keyup (e) ->
      if e.keyCode == 13
        window.ROOM.dispatcher.dispatcher.trigger 'submit', @value
        @value = ''

