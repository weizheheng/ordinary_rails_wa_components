# frozen_string_literal: true

class TextFieldComponent < ViewComponent::Base
  def initialize(
    method_name,
    type: "text",
    form: nil,
    label: nil,
    hint: nil,
    placeholder: nil,
    clearable: nil,
    password_toggle: nil,
    disabled: nil,
    filled: nil,
    size: nil,
    pill: nil,
    **options
  )
    @type = type
    @form = form
    @method_name = method_name
    @label = label
    @hint = hint
    @placeholder = placeholder
    @clearable = clearable || nil
    @password_toggle = password_toggle
    @disabled = disabled || nil
    @filled = filled || nil
    @size = size
    @pill = pill || nil
    @options = options
  end

  private

    def error_message
      return @error_message if defined?(@error_message)
      return nil unless has_error?

      @error_message = raw @form.object.errors.messages_for(@method_name)&.join(", ")
    end

    def has_error?
      return @has_error if defined?(@has_error)
      return false if @form&.object.blank?

      @has_error = @form.object.errors.key?(@method_name)
    end

    def text_field_options
      options = {
        type: @type,
        label: @label || @method_name.to_s.titleize,
        hint: @hint,
        placeholder: @placeholder,
        clearable: @clearable,
        "password-toggle": @password_toggle,
        disabled: @disabled,
        filled: @filled,
        size: @size,
        pill: @pill,
        **@options
      }

      if @form
        options.merge!(@form.options.slice(:allow_method_names_outside_object, :skip_default_ids, :builder))
        options.merge!(object: @form.object)
        options.merge!(invalid: true) if has_error?

        options = ::OrdinaryRailsWaComponents::Tags::WaTextField.new(
          @form.object_name,
          @method_name,
          @form.template,
          options
        ).parsed_options
      end

      options
    end
end
