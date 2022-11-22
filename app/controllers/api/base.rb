module API
  class Base < Grape::API
    helpers Devise::Controllers::Helpers
    mount API::V1::Base
  end
end
