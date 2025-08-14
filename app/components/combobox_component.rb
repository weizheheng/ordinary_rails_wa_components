# frozen_string_literal: true

class ComboboxComponent < ViewComponent::Base
  include ::HotwireCombobox::Helper

  def initialize(
    name,
    options_or_src = [],
    template: nil,
    form: nil,
    render_in: {},
    include_blank: nil,
    label: nil,
    **kwargs
  )
    @name = name
    @options_or_src = options_or_src
    @render_in = render_in
    @template = template
    @include_blank = include_blank
    @form = form
    @label = label || @name.to_s.titleize
    @kwargs = form ? kwargs.merge(form: form) : kwargs
  end

  private

    def options
      extracted_options_and_src[0]
    end

    def src
      extracted_options_and_src[1]
    end

    def extracted_options_and_src
      return @extracted_options_and_src if defined?(@extracted_options_and_src)

      if @render_in.present?
        if @options_or_src.is_a? String

          @options = ::HotwireCombobox::Listbox::Item.collection_for(@template, [])
          @src = @options_or_src
        else

          @options = ::HotwireCombobox::Listbox::Item.collection_for(
            @template,
            @options_or_src,
            render_in: @render_in,
            include_blank: @include_blank,
            display: :to_combobox_display
          )
          @src = nil
        end
      else
        @options, @src = hw_extract_options_and_src @options_or_src, @render_in, @include_blank
      end

      @extracted_options_and_src = [@options, @src]
    end

    def classes
      classes = ["wa-combobox"]

      classes << "combobox-invalid" if has_error?

      classes.join(" ")
    end

    def error_message
      return @error_message if defined?(@error_message)
      return nil unless has_error?


      @error_message = raw @form.object.errors.messages_for(@name)&.join(", ")
    end

    def has_error?
      return @has_error if defined?(@has_error)
      return false if @form&.object.blank?

      @has_error = @form.object.errors.key?(@name)
    end
end
