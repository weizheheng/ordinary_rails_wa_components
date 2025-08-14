# frozen_string_literal: true

class IconButtonComponent < ViewComponent::Base
  def initialize(name:, family: "solid", **options)
    @name = name
    @family = family
    @options = options
  end

  private
    def icon_button_options
      {
        name: @name,
        family: @family,
        **@options
      }
    end
end
