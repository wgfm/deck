defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "can produce a joker" do
    joker = Cards.joker
    assert joker.special == :joker
  end
end
