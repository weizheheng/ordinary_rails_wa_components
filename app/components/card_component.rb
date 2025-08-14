# frozen_string_literal: true

class CardComponent < ViewComponent::Base
  def initialize(
    style: nil,
    **options
  )
    @style = style
    @options = options
  end

  private
    def card_options
      {
        style: @style,
        **@options
      }
    end
end
