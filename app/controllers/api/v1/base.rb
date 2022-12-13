module API
  module V1
    class Base < Grape::API
      require 'active_model_serializers/register_jsonapi_renderer'
      include ActiveModelSerializers::Jsonapi::ControllerSupport
      include API::V1::Defaults
      formatter :json, Grape::Formatter::ActiveModelSerializers

      before do
        authenticate_user!
      end

      mount API::V1::Accommodations
      mount API::V1::Rentals
    end
  end
end
