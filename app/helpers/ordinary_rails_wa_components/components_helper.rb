# frozen_string_literal: true

module OrdinaryRailsWaComponents
  module ComponentsHelper
    COMPONENTS = {
      wa_button: "ButtonComponent",
      wa_icon: "IconComponent",
      wa_callout: "CalloutComponent",
      wa_text_field: "TextFieldComponent",
      wa_text_area: "TextAreaComponent",
      wa_combobox: "ComboboxComponent",
      wa_new_combobox: "NewComboboxComponent",
      wa_card: "CardComponent",
      wa_navigation_item: "NavigationItemComponent",
      wa_icon_button: "IconButtonComponent",
      wa_checkbox: "CheckboxComponent",
      wa_select: "SelectComponent"
    }

    COMPONENTS.each do |name, component|
      define_method :"#{name}" do |*args, **kwargs, &block|
        render component.constantize.new(*args, **kwargs), &block
      end
    end

    def wa_form_with(model: false, scope: nil, url: nil, format: nil, **options, &block)
      form_with(
        model: model,
        scope: scope,
        url: url,
        format: format,
        builder: WaFormBuilder,
        data: { controller: "wa-form" },
        **options,
        &block
      )
    end
  end
end
