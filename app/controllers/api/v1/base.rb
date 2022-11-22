module API
  module V1
    class Base < Grape::API
      include API::V1::Defaults
      formatter :json, Grape::Formatter::ActiveModelSerializers

      before do
        authenticate_user!
      end

      mount API::V1::Accommodations
    end
  end
end
