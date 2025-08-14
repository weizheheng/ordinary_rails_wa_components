# frozen_string_literal: true

class NavigationItemComponent < ViewComponent::Base
  def initialize(path:, current: false, **options)
    @path = path
    @current = current
    @options = options
  end

  private
    def navigation_item_options
      klass = @options.delete(:class) || ""
      klass += " current" if @current

      {
        class: klass,
        **@options
      }
    end
end
