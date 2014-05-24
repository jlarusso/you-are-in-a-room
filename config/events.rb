WebsocketRails::EventMap.describe do
  # WS connection
  subscribe :client_connected, 'websocket#client_connected'
  subscribe :client_disconnected, 'websocket#client_disconnected'

  # Game
  subscribe :get_current_room, 'websocket#get_current_room'
end
