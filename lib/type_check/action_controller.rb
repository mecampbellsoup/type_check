module TypeCheck
  module ActionController
    def self.included base
      base.extend ClassMethods
    end

    module ClassMethods
      def assert_params_format(rules, options = {})
        before_action(only: options[:only]) do
          document = TypeCheck::Document.new(params, rules)
          if document.valid?
            # No-op, allow the request to proceed into the action definition.
          else
            yield document.errors
            # NOTE: return the response if it's been prepared. Otherwise, raise
            # CannotProcessRequest due to errors on the type checked document.
            # http://api.rubyonrails.org/classes/ActionController/Metal.html#method-i-performed-3F
            performed? ? return : raise(CannotProcessRequest)
          end
        end
      end
    end
  end
end
