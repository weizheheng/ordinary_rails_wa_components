# frozen_string_literal: true

module OrdinaryRailsWaComponents
  class Tags::WaTextField < ActionView::Helpers::Tags::TextField
    def parsed_options
      options = @options.stringify_keys
      options["size"] = options["maxlength"] unless options.key?("size")
      options["type"] ||= field_type
      options["value"] = options.fetch("value") { value_before_type_cast } unless field_type == "file"
      add_default_name_and_id(options)

      options
    end
  end
end
