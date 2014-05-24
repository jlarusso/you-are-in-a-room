$ ->
  window.ROOM = {}
  window.ROOM.dispatcher = new Dispatcher
  window.ROOM.prompt = new Prompt

  window.ROOM.dispatcher.dispatcher.trigger "current_room"

