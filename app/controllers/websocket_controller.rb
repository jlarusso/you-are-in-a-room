class WebsocketController < WebsocketRails::BaseController
  def initialize_session
  end


  def client_connected
    puts ""
    puts "*** Client connected ***"
    puts ""
  end


  def client_disconnected
    puts ""
    puts "*** Client disconnected ***"
    puts ""
  end


  def get_current_room
    set_current_node
    broadcast_message :append_message, @node.description
  end

  def submit
    broadcast_message :append_message, message
  end

  private

  def set_current_node
    @node = Player.first.node
  end
end
