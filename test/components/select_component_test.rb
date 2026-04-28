# frozen_string_literal: true

require "test_helper"
require "view_component/test_helpers"

class SelectComponentTest < ActiveSupport::TestCase
  include ViewComponent::TestHelpers

  test "marks matching option selected for scalar value" do
    render_inline SelectComponent.new(
      :terrain_access,
      value: "trail",
      select_options: [
        { label: "Road", value: "road" },
        { label: "Trail", value: "trail" }
      ]
    )

    assert_selector("wa-option[value='trail'][selected]", count: 1)
    assert_selector("wa-option[value='road'][selected]", count: 0)
  end

  test "marks matching options selected for array value" do
    render_inline SelectComponent.new(
      :terrain_access,
      value: ["road", "trail"],
      select_options: [
        { label: "Road", value: "road" },
        { label: "Trail", value: "trail" },
        { label: "Track", value: "track" }
      ]
    )

    assert_selector("wa-option[value='road'][selected]", count: 1)
    assert_selector("wa-option[value='trail'][selected]", count: 1)
    assert_selector("wa-option[value='track'][selected]", count: 0)
  end

  test "omits select value attribute for multiple select with array value" do
    render_inline SelectComponent.new(
      :terrain_access,
      multiple: true,
      value: ["road", "trail"],
      select_options: [
        { label: "Road", value: "road" },
        { label: "Trail", value: "trail" }
      ]
    )

    assert_selector("wa-select[multiple]", count: 1)
    assert_selector("wa-select[value]", count: 0)
  end
end
