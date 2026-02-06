# frozen_string_literal: true

class SelectComponent < ViewComponent::Base
  def initialize(
    method_name,
    form: nil,
    label: nil,
    hint: nil,
    placeholder: nil,
    clearable: nil,
    disabled: nil,
    size: nil,
    select_options: [],
    **options
  )
    @form = form
    @method_name = method_name
    @label = label
    @hint = hint
    @placeholder = placeholder
    @clearable = clearable || nil
    @disable = disabled || nil
    @size = size
    @select_options = select_options
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

    def select_options
      options = {
        label: @label || @method_name.to_s.titleize,
        hint: @hint,
        placeholder: @placeholder,
        "with-clear": @clearable,
        disabled: @disabled,
        size: @size,
        **@options
      }

      if @form
        options.merge!(@form.options.slice(:allow_method_names_outside_object, :skip_default_ids, :builder))
        options.merge!(object: @form.object)
        options.merge!(invalid: true) if has_error?

        options = ::OrdinaryRailsWaComponents::Tags::WaSelect.new(
          @form.object_name,
          @method_name,
          @form.template,
          options
        ).parsed_options
      end

      options
    end
end
