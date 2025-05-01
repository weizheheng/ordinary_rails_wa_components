# frozen_string_literal: true

module OrdinaryRailsWaComponents
  module ComponentsHelper
    COMPONENTS = {
      wa_button: "ButtonComponent"
    }

    COMPONENTS.each do |name, component|
      define_method :"#{name}" do |*args, **kwargs, &block|
        render component.constantize.new(*args, **kwargs), &block
      end
    end
  end
end
