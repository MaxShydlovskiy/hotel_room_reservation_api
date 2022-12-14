From CamelCase to snake_case transform keys

Solution for Rails 5

before_action :underscore_params!

def underscore_params!
  underscore_hash = -> (hash) do
    hash.transform_keys!(&:underscore)
    hash.each do |key, value|
      if value.is_a?(ActionController::Parameters)
        underscore_hash.call(value)
      elsif value.is_a?(Array)
        value.each do |item|
          next unless item.is_a?(ActionController::Parameters)
          underscore_hash.call(item)
        end
      end
    end
  end
  underscore_hash.call(params)
end

With Rails 5.2

module UnderscoreizeParams
  extend ActiveSupport::Concern

  def process_action(*args)
    request.parameters.deep_transform_keys!(&:underscore)
    super
  end
end

class V1::BaseController
  include UnderscoreizeParams
end

Another rails 5.1 solution

before_action :normalize_key!

 def normalize_keys!(val = params)
  if val.class == Array
    val.map { |v| normalize_keys! v }
  else
    if val.respond_to?(:keys)
      val.keys.each do |k|
        current_key_value = val[k]
        val.delete k
        val[k.to_s.underscore] = normalize_keys!(current_key_value)
      end
    end
    val
  end
  val
end

Rails 4:

before_filter :deep_underscore_params!


def deep_underscore_params!(val = request.parameters)
  case val
  when Array
    val.map { |v| deep_underscore_params!(v) }
  when Hash
    val.keys.each do |k, v = val[k]|
      val.delete k
      val[k.underscore] = deep_underscore_params!(v)
    end

    params = val
  else
    val
  end
end



Also can use https://github.com/technicalpanda/plissken

For snake_case to Camel Case:

https://github.com/technicalpanda/awrence

or just camelize method of ActiveSupport


Usage

puts self.camelize_array(array:Post.all.to_a,conditions:{id: "_id", post_type: "type"}

Implementation

def self.camelize_array(array:,conditions: {})
    final = JSON.parse array.to_json
    final.each do |a|
        a.transform_keys! do |key| 
            if conditions.keys.include? key.to_sym
                key = conditions[key.to_sym]
            else
                key.camelize(:lower)
            end
        end
    end
    final.to_json
end


One more gem: https://github.com/nesquena/rabl

Simply code:
> s = 'this is a sentence'
 => "this is a sentence"
> s.gsub(/\s(.)/) {|e| $1.upcase}
 => "thisIsASentence"

 One more solution:
 Using Rails' ActiveSupport, the following works for both cases:

"this is a sentence".underscore.parameterize("_").camelize(:lower)
# => "thisIsASentence"

"my-name".underscore.parameterize("_").camelize(:lower)
# => "myName"

Another code:
'this is a sentence'.split.map.with_index { |x,i| i == 0 ? x : x.capitalize  }.join # => "thisIsASentence"

Pure solution for Rails:
https://api.rubyonrails.org/classes/String.html#method-i-camelize

You might try using the 'English' gem, available at http://english.rubyforge.org/

require 'english/case'

a = "This is a test."

a.camelcase().uncapitalize() # => 'thisIsATest
