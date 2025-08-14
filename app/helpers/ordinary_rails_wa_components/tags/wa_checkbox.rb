# frozen_string_literal: true

module OrdinaryRailsWaComponents
  class Tags::WaCheckbox < ActionView::Helpers::Tags::CheckBox
    def parsed_options
      options = @options.stringify_keys
      options["type"]     = "checkbox"
      options["value"]    = @checked_value
      options["checked"] = "checked" if input_checked?(options)

      add_default_name_and_id(options)

      options
    end
  end
end
