defmodule Deck do
  defstruct cards: []
  @suits = [:spades, :hearts, :clubs, :diamonds]
  @values = [:ace, 2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king]

  def new_standard_52 do
    cards = for suit <- @suits, value <- @values, do: %Card{suit: suit, value: value}
    %Deck{
      cards: cards
    }
  end

  # Shuffles the deck
  def shuffle(deck) do
    %{deck | cards: Enum.shuffle(deck.cards) }
  end

  def draw(deck) do
    [card | rest] = deck.cards
    { card, %Deck{cards: rest} }
  end

  def add(deck, card) do
    %{deck | cards: [card | deck.cards]}
  end
end