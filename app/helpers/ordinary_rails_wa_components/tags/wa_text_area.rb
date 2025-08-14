# frozen_string_literal: true

module OrdinaryRailsWaComponents
  class Tags::WaTextArea < ActionView::Helpers::Tags::TextArea
    def parsed_options
      options = @options.stringify_keys
      add_default_name_and_id(options)
      options["value"] = options.delete("value") { value_before_type_cast }

      options
    end
  end
end
