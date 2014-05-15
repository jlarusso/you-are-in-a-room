class Item < ActiveRecord::Base
  include Food

  belongs_to :owner, polymorphic: true
end
