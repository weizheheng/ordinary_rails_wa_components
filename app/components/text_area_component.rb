# frozen_string_literal: true

class TextAreaComponent < ViewComponent::Base
  # param appearance: ["filled", "outlined"]
  # param resize: ["none", "vertical", "horizontal", "both", "auto"]
  def initialize(
    method_name,
    form: nil,
    rows: 4,
    resize: "vertical",
    readonly: false,
    appearance: "outlined",
    size: "inherit",
    label: nil,
    placeholder: nil,
    hint: nil,
    disabled: nil,
    required: false,
    **options
  )
    @method_name = method_name
    @form = form
    @rows = rows
    @resize = resize
    @readonly = readonly
    @appearance = appearance
    @size = size
    @label = label
    @hint = hint
    @placeholder = placeholder
    @disabled = disabled || nil
    @required = required
    @options = options
  end

  private

  def error_message
    return @error_message if defined?(@error_message)
    return nil unless has_error?

    @error_message = raw @form.object.errors.full_messages_for(@method_name)&.first
  end

  def has_error?
    return @has_error if defined?(@has_error)
    return false if @form&.object.blank?

    @has_error = @form.object.errors.key?(@method_name)
  end

  def textarea_options
    options = {
      rows: @rows,
      resize: @resize,
      readonly: @readonly,
      appearance: @appearance,
      size: @size,
      label: @label || @method_name.to_s.titleize,
      placeholder: @placeholder,
      hint: @hint,
      disabled: @disabled,
      required: @required,
      **@options
    }

    if @form
      options.merge!(@form.options.slice(:allow_method_names_outside_object, :skip_default_ids, :builder))
      options.merge!(object: @form.object)
      options.merge!(invalid: true) if has_error?

      options = ::OrdinaryRailsWaComponents::Tags::WaTextArea.new(
        @form.object_name,
        @method_name,
        @form.template,
        options
      ).parsed_options
    end

    options
  end
end
