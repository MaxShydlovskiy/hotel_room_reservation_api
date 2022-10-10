# README

For CamelCase - "keys".camelize 
Or:

"keys".split('_').collect(&:capitalize).join

For snake_case:

def snake_case
  return downcase if match(/\A[A-Z]+\z/)
  gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').
  gsub(/([a-z])([A-Z])/, '\1_\2').
  downcase
end

"YoursKeys".snake_case  #=> "yours_keys"

Or just use Rail's ActiveSupport:

class String
  def underscore
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end
end

"BlaBlaBla".underscore
=> "bla_bla_bla"
