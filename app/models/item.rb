class Item < ActiveRecord::Base
  include Food

  belongs_to :owner, polymorphic: true

  acts_as_savable :owner_id, :owner_type
end
