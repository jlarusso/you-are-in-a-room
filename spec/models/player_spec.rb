require 'spec_helper'

describe Player do
  let(:n1)     { Node.find(1) }
  let(:n2)     { Node.find(2) }
  let(:n3)     { Node.find(3) }
  let(:player) { create(:player) }
  let(:item)   { create(:item, name: 'barrel of molasses') }

  describe "#move_to" do
    it "moves the player to another node" do
      player.node = n1
      player.move_to(n2)
      expect(player.node).to eq(n2)
    end

    it "won't move the player to an unconneted node" do
      player.node = n1
      player.move_to(n3)
      expect(player.node).to eq(n1)
    end
  end

  describe "#pick_up" do
    it "picks up an item" do
      player.node = n1
      item.owner = n1
      item.save
      player.pick_up item.name
      expect(player.items.first.name).to eq(item.name)
    end

    it "removes the item from its former owner" do
      player.node = n1
      item.owner = n1
      item.save
      player.pick_up item.name
      expect(n1.items).to be_empty
    end
  end

  describe "#drop" do
  end
end

