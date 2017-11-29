module Randomize
  extend ActiveSupport::Concern

  class_methods do

    def random
      offset_count = rand(self.count)
      offset(offset_count)
      .first
    end

  end
end
