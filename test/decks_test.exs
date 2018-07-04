defmodule DecksTest do
  use ExUnit.Case
  doctest Decks

  test "can produce a standard 52-card deck" do
    deck = Decks.standard_52

    assert Enum.count(deck.cards) == 52
  end

  test "can produce a standard 52-card deck with jokers" do
    deck = Decks.standard_52(jokers: 2)

    assert Enum.count(deck.cards) == 54

    jokers = Enum.filter(deck.cards, fn card -> card.special == :joker end)
    assert Enum.count(jokers) == 2
  end
end