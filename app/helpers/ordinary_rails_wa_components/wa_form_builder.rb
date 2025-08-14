# frozen_string_literal: true

class OrdinaryRailsWaComponents::WaFormBuilder < ActionView::Helpers::FormBuilder
  include ::HotwireCombobox::Helper

  attr_reader :template

  delegate :render, to: :template

  def text_field(method, **options, &block)
    render(
      TextFieldComponent.new(
        method,
        type: "text",
        form: self,
        **options
      ),
      &block
    )
  end

  def checkbox(method, checked_value: "1", unchecked_value: "0", **options, &block)
    render(
      CheckboxComponent.new(
        method,
        form: self,
        checked_value: checked_value,
        unchecked_value: unchecked_value,
        **options
      ),
      &block
    )
  end

  def text_area(method, **options, &block)
    render(
      TextAreaComponent.new(
        method,
        form: self,
        **options
      ),
      &block
    )
  end

  def combobox(*args, **kwargs, &block)
    render(
      ComboboxComponent.new(
        *args,
        template: template,
        form: self,
        **kwargs
      ),
      &block
    )
  end
end
