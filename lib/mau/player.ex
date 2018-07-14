# A player starts out with seven cards
defmodule Mau.Player do
  defstruct id: nil, hand: [], drawn: false, plays: nil

  alias Mau.Player

  def start(deck) do
    {new_deck, player_cards} = deal(deck, [], 7)
    player = %Player{hand: player_cards}
    {player, new_deck}
  end

  def play(%{hand: hand} = player, card) do
    if has_card(player, card) do
      new_hand = List.delete(hand, card)
      %{player | hand: new_hand}
    else
      {:invalid, "Player does not have such card"}
    end
  end

  def has_card(%{hand: hand}, card) do
    Enum.any?(hand, card)
  end

  def hand_size(player) do
    Enum.count(player.hand)
  end

  def may_pass(player) do
    player.drawn
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
