# frozen_string_literal: true

module OrdinaryRailsWaComponents
  class Tags::WaSelect < ActionView::Helpers::Tags::Base
    def parsed_options
      options = @options.stringify_keys
      options["value"] = options.fetch("value") { value }
      add_default_name_and_id(options)

      options
    end
  end
end
