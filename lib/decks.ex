# Decks provides convenience functions to create different
# kinds of decks, such as a standard 52 deck, a deck with Jokers
# or a Pickard deck
defmodule Decks do
  @suits [:spades, :hearts, :clubs, :diamonds]
  @values [:ace, 2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king]

  def standard_52(opts \\ []) do
    cards = for suit <- @suits, value <- @values, do: %Card{suit: suit, value: value}
    deck = %Deck{ cards: cards }

    Cards.joker
    |> List.duplicate(opts[:jokers] || 0)
    |> Enum.reduce(deck, fn (deck, card) -> Deck.add(deck, card) end)
    |> maybe_shuffle(opts[:shuffle])
  end

  defp maybe_shuffle(deck, should_shuffle=true) do
    Deck.shuffle(deck)
  end

  defp maybe_shuffle(deck, _should_shuffle) do
    deck
  end
end