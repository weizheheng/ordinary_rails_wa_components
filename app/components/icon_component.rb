# frozen_string_literal: true

class IconComponent < ViewComponent::Base
  def initialize(name:, variant: "solid", library: "default", family: "classic", **options)
    @name = name
    @variant = variant
    @library = library
    @family = family
    @options = options
  end

  private
    def icon_options
      {
        name: @name,
        variant: @variant,
        library: @library,
        family: @family,
        **@options
      }
    end
end
