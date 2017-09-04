require 'type_check/version'
require 'type_check/object'
require 'type_check/comparison'
require 'type_check/action_controller'
require 'active_support/core_ext/hash'

module TypeCheck
  Hash.include CoreExtensions::Hash
end
