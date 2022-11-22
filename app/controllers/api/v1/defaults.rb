module API
  module V1
    module Defaults
      extend ActiveSupport::Concern

      included do
        prefix 'api'
        version 'v1', using: :path
        default_format :json
        format :json

        helpers do
          def permitted_params
            @permitted_params ||= CaseTransform.underscore(declared(params, include_missing: false))
          end

          def current_user
            env['warden'].user
          end
        end
      end
    end
  end
end
