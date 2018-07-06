# A player starts out with seven cards
defmodule Mau.Player do
  defstruct hand: [], drawn: false

  alias Mau.Player

  # Initializing players

  def start(deck) do
    {new_deck, player_cards} = deal(deck, [], 7)
    {new_deck, %Player{hand: player_cards}}
  end

  def hand_size(player) do
    Enum.count(player.hand)
  end

  def draw(player, card) do
    %{player | hand: [card | player.hand], drawn: true}
  end

  defp deal(deck, cards, 0) do
    {deck, cards}
  end

  defp deal(deck, cards, n) do
    {card, deck} = Deck.draw(deck)
    deal(deck, [card | cards], n - 1)
  end
end
