# Decks provides convenience functions to create different
# kinds of decks, such as a standard 52 deck, a deck with Jokers
# or a Pickard deck
defmodule Decks
  @suits = [:spades, :hearts, :clubs, :diamonds]
  @values = [:ace, 2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king]

  def standard_52(should_shuffle \\ true) do
    cards = for suit <- @suits, value <- @values, do: %Card{suit: suit, value: value}
    %Deck{ cards: cards }
    |> maybe_shuffle(should_shuffle)
  end

  def standard_52(num_jokers, should_shuffle \\ true) do
    deck = standard_52(false)

    Cards.joker
    |> List.duplicate(num_jokers)
    |> Enum.reduce(deck, fn (deck, card) -> %{deck | cards: [card | deck.cards]} end)
    |> maybe_shuffle(should_shuffle)
  end

  defp maybe_shuffle(deck, should_shuffle=true) do
    Deck.shuffle(deck)
  end

  defp maybe_shuffle(deck, should_shuffle=false) do
    deck
  end
end