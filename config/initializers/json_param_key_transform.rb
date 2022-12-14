# File: config/initializers/json_param_key_transform.rb
# Transform JSON request param keys from JSON-conventional camelCase to
# Rails-conventional snake_case:
ActionDispatch::Request.parameter_parsers[:json] = lambda { |raw_post|
  # Modified from action_dispatch/http/parameters.rb
  data = ActiveSupport::JSON.decode(raw_post)

  # Transform camelCase param keys to snake_case
  if data.is_a?(Array)
    data.map { |item| item.deep_transform_keys!(&:underscore) }
  else
    data.deep_transform_keys!(&:underscore)
  end

  # Return data
  data.is_a?(Hash) ? data : { '_json': data }
}

# For Rails 4.2 (and maybe earlier versions)
# File: config/initializers/json_param_key_transform.rb
# Transform JSON request param keys from JSON-conventional camelCase to
# Rails-conventional snake_case:
# Rails.application.config.middleware.swap(
  # ::ActionDispatch::ParamsParser, ::ActionDispatch::ParamsParser,
  # ::Mime::JSON => Proc.new { |raw_post|

  # Borrowed from action_dispatch/middleware/params_parser.rb except for
  # data.deep_transform_keys!(&:underscore) :
    # data = ::ActiveSupport::JSON.decode(raw_post)
    # data = {:_json => data} unless data.is_a?(::Hash)
    # data = ::ActionDispatch::Request::Utils.deep_munge(data)
    
    # Transform camelCase param keys to snake_case:
    # data.deep_transform_keys!(&:underscore)

    # data.with_indifferent_access
  # }
# )

# In Rails 6.1 will be added deep_transform_keys to 
# ActionController::Parameters so it enables you to make 
# it as simple as:

# class ApplicationController < ActionController::Base
  # before_action :underscore_params!

  # private

  # def underscore_params!
    # params.deep_transform_keys!(&:underscore)
  # end
# end

# Edit

# At the moment you can backport as follows:

# module DeepTransformKeys
  # def deep_transform_keys!(&block)
    # @parameters.deep_transform_keys!(&block)
    # self
  # end
# end

# ActionController::Parameters.include(DeepTransformKeys)

