module CamelJson
  def as_json(options)
    camelize_keys(super(options))
  end

  private
  def camelize_keys(hash)
    values = hash.map do |key, value|
      [key.camelize(:lower), value]
    end
    Hash[values]
  end
end

# app/models/your_model.rb
# require 'camel_json'
# class YourModel < ActiveRecord::Base
    # include CamelJson
# end
