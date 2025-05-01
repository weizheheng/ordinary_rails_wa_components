# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  # param variant: [neutral, brand, success, warning, danger]
  # param appearance: [accent, filled, outlined, plain]
  # param type: [button, submit, reset]
  def initialize(variant: "neutral", appearance: "accent", type: "button", **options)
    @variant = variant
    @appearance = appearance
    @type = type
    @options = options
  end

  private
    def button_options
      {
        variant: @variant,
        appearance: @appearance,
        type: @type,
        **@options
      }
    end
end
