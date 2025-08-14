# frozen_string_literal: true

require "stimulus-rails"
require "view_component"
require "hotwire_combobox"
require "hotwire_combobox/helper"

module OrdinaryRailsWaComponents
  class Engine < ::Rails::Engine
    isolate_namespace OrdinaryRailsWaComponents

    # Ensure ViewComponent is loaded
    config.before_initialize do
    end

    # Make helpers available to the main app
    initializer "ordinary_rails_wa_components.helpers" do |app|
      ActiveSupport.on_load(:action_controller) do
        helper OrdinaryRailsWaComponents::ComponentsHelper
      end
    end

    # `before:` option has to be a string as it has to match
    # a named initializer exaclty as a String or a Symbol
    # "importmap" is a string, you can see this list to check
    # the order of initializers:
    #   Rails.application.initializers.tsort.map(&:name)
    initializer "ordinary_rails_wa_components.importmap", before: "importmap" do |app|
      # https://github.com/rails/importmap-rails#composing-import-maps
      app.config.importmap.paths << root.join("config/importmap.rb")

      # https://github.com/rails/importmap-rails#sweeping-the-cache-in-development-and-test
      app.config.importmap.cache_sweepers << root.join("app/javascript")
    end

    initializer "ordinary_rails_wa_components.assets" do |app|
      # my_engine/app/javascript needs to be in the asset path
      app.config.assets.paths << root.join("app/javascript")
      app.config.assets.paths << root.join("app/assets/stylesheets")

      app.config.assets.precompile << "ordinary_rails_wa_components/application.css"
    end
  end
end
