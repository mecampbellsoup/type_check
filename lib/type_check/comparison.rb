module TypeCheck
  class Comparison
    def initialize(rules:, params:)
      @rules = TypeCheck::Rules.new(rules)
      @params = TypeCheck::Object.new(params)
    end

    def valid?
      @rules.paths.each do |path|
        param_with_rule = ParameterWithRule.new(
          rule:      @rules.find(*path),
          parameter: @params.find(*path)
        )

        error = param_with_rule.validate
        path_string = path.join("/")
        @errors[path_string] = param_with_rule.validate if error
      end
    end
  end

  class ParameterWithRule
    def initialize(parameter:, rule:)
      @parameter, @rule = parameter, rule
    end

    # Return nil if the parameter meets the rule's constraint(s).
    # Otherwise return a tuple conforming to (path_to_param, reason_not_valid).
    def validate
      if !parameter.value.is_a?(rule.condition)
        "param_must_be_#{rule.condition.name.downcase}"
      end
    end

    private

    attr_reader :parameter, :rule
  end

  private_constant :ParameterWithRule
end
