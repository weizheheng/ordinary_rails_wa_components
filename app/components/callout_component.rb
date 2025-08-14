# frozen_string_literal: true

class CalloutComponent < ViewComponent::Base
  # param variant: ["neutral", "brand", "success", "warning", "danger", "inherit"]
  # param appearance: ["accent", "filled", "outlined", "plain", "outlined filled", "outlined accent"]
  def initialize(variant: "inherit", appearance: "outlined filled", **options)
    @variant = variant
    @appearance = appearance
    @options = options
  end

  private

    def callout_options
      {
        variant: @variant,
        appearance: @appearance,
        **@options
      }
    end
end
