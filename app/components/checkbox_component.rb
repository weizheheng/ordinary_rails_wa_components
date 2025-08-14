# frozen_string_literal: true

class CheckboxComponent < ViewComponent::Base
  def initialize(method_name, form: nil, checked_value:, unchecked_value:, **options)
    @method_name = method_name
    @form = form
    @checked_value = checked_value
    @unchecked_value = unchecked_value
    @options = options
  end

  private
    def checkbox_options
      options = {
        **@options
      }

      if @form
        options.merge!(@form.options.slice(:allow_method_names_outside_object, :skip_default_ids, :builder))
        options.merge!(object: @form.object)

        options = ::OrdinaryRailsWaComponents::Tags::WaCheckbox.new(
          @form.object_name,
          @method_name,
          @form.template,
          @checked_value,
          @unchecked_value,
          options
        ).parsed_options
      end

      options
    end
end
