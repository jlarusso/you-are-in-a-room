class WebsocketController < WebsocketRails::BaseController
  def initialize_session
  end


  def client_connected
    id = params[:uuid]
    puts "***"
    puts "Client #{id} connected"
  end


  def client_disconnected
    id = params[:uuid]
    puts "***"
    puts "Client #{id} disconnected"
  end


  def get_current_room
    set_current_node
    broadcast_message :current_room, { output: @node.description }
  end

  private

  def set_current_node
    @node = Player.first.node
  end
end
