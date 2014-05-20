module ActsAsSavable
  extend ActiveSupport::Concern

  included do
  end

  module ClassMethods
    def acts_as_savable(options = {})
      binding.pry
    end
  end
end

ActiveRecord::Base.send :include, ActsAsSavable
