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


  def send_output
    broadcast_message :send_output, { output: "testing" }
  end
end
