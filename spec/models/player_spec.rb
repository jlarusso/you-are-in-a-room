require 'spec_helper'

describe Player do
  describe "#move_to" do
    let(:n1)     { Node.find(1) }
    let(:n2)     { Node.find(2) }
    let(:n3)     { Node.find(3) }
    let(:player) { create(:player) }

    it "moves the player to another node" do
      player.node = n1
      player.move_to(n2)

      expect(player.node).to eq(n2)
    end

    it "won't move the player to an unconneted node" do
      player.node = n1

      expect { player.move_to(n3) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "#pick_up" do
  end

  describe "#drop" do
  end
end

