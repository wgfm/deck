defmodule Deck do
  defstruct cards: []

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

  def add_joker(deck) do
    %{deck | cards: [Cards.joker | deck.cards]}
  end
end