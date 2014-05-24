WebsocketRails::EventMap.describe do
  # WS connection
  subscribe :client_connected, 'websocket#client_connected'
  subscribe :client_disconnected, 'websocket#client_disconnected'

  # Game
  subscribe :send_output, 'websocket#send_output'
end
