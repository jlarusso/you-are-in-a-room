class WebsocketController < WebsocketRails::BaseController
  def initialize_session
  end


  def client_connected
    puts ""
    puts "*** Client connected ***"
    puts ""
    get_current_room
  end


  def client_disconnected
    puts ""
    puts "*** Client disconnected ***"
    puts ""
  end


  def get_current_room
    broadcast_message :append_message, Parser.parse('look')
  end

  def submit
    broadcast_message :append_message, Parser.parse(message)
  end
end
