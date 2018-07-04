defmodule DeckTest do
  use ExUnit.Case
  doctest Deck

  test "shuffles the cards" do
    {deck, shuffled} = decks()

    assert deck.cards != shuffled.cards
  end

  test "does not lose cards when shuffling" do
    {deck, shuffled} = decks()

    assert Enum.count(deck.cards) == Enum.count(shuffled.cards)
  end

  test "draws a card" do
    cards = [1, 2, 3]
    original = %Deck{cards: cards}
    {drawn, rest} = Deck.draw(original)

    assert Enum.count(original.cards) == Enum.count(rest.cards) + 1
    assert drawn == 1
  end

  test "adds a card" do
    cards = [1, 2, 3]
    original = %Deck{cards: cards}
    new = Deck.add(original, 0)

    assert Enum.count(original.cards) == Enum.count(new.cards) - 1
    assert new.cards == [0, 1, 2, 3]
  end

  defp decks do
    deck = Decks.standard_52(shuffle: false, jokers: 2)
    shuffled = Deck.shuffle(deck)

    {deck, shuffled}
  end
end
