# File: config/initializers/params_snakeizer.rb
# Transform JSON request param keys from JSON-conventional camelCase to
# Rails-conventional snake_case
module ActionController
  # Modified from action_controller/metal/strong_parameters.rb
  class Parameters
    def deep_snakeize!
      @parameters.deep_transform_keys!(&:underscore)
      self
    end
  end
end

# File: app/controllers/application_controller.rb
# class ApplicationController < ActionController::API
  # protected

    # # Snakeize JSON API request params
    # def snakeize_params
      # params.deep_snakeize!
    # end
# end

# Add to our conyroller, like Accommodations
# module API
  # module V1
    # class Accommodations < Grape::API
      # before_action :snakeize_params, only: [:create]
      # ... Code
      # ...
    # end
  # end
# end



