module TypeCheck
  module ActionController
    def self.included base
      base.extend ClassMethods
    end

    module ClassMethods
      def assert_params_format rules, options = {}
        before_action only: options[:only] do
        end
      end
    end
  end
end
