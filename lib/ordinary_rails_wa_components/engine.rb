# frozen_string_literal: true

module OrdinaryRailsWaComponents
  class Engine < ::Rails::Engine
    isolate_namespace OrdinaryRailsWaComponents

    # Ensure ViewComponent is loaded
    config.before_initialize do
      require "view_component"
    end

    # Make helpers available to the main app
    initializer "ordinary_rails_wa_components.helpers" do |app|
      ActiveSupport.on_load(:action_controller) do
        helper OrdinaryRailsWaComponents::ComponentsHelper
      end
    end
  end
end
