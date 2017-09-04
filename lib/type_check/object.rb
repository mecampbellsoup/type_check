require 'active_support/core_ext/hash'

module TypeCheck
  RuleNotFound = Class.new(StandardError)

  class Object
    def initialize(values = {})
      @values = values.with_indifferent_access
    end

    def paths
      @values.paths.map { |p| p.split("/") }
    end

    # find(["data", "attributes", "name"])
    # Returns a Rule instance when the path points to an existing rule.
    # Returns nil otherwise.
    def find(path)
      value = @values.dig(*path)
      Tuple.new(path, value) if value
    end
  end
end

