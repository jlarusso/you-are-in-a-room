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

  def check_scripts
    puts Player.first.node.verbs.map(&:action)

    Player.first.node.verbs.each { |verb| Action.try(verb.action, verb.id) }
    output = Player.first.node.verbs.map(&:output_text)

    unless output.compact.empty?
      broadcast_message :append_message, output
    end
  end
end
