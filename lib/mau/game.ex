# A game of Mau has n players, where n >= 2.
#
# Players are in a circle, each taking turns clockwise.
defmodule Mau.Game do
  defstruct players: [], deck: nil, pile: nil, action: nil

  alias Mau.{Pile, Player, Game}

  def start(num_players) do
    deck = Decks.standard_52(jokers: 2, shuffle: true)

    {deck, players} = Enum.reduce(1..num_players, {deck, []}, fn _, {deck, players} ->
      {new_deck, player} = Player.start(deck)
      {new_deck, [player | players]}
    end)

    {card, deck} = Deck.draw(deck)

    %Game{
      players: players,
      deck: deck,
      pile: %Pile{cards: [card]}
    }
  end

  # Turn logic

  def end_turn(%{action: :repeat} = game) do
    game
    |> reset_action
  end

  def end_turn(%{action: :skip_next} = game) do
    game
    |> reset_action
    |> next_player
    |> next_player
  end

  def end_turn(%{action: :invert} = game) do
    game
    |> reset_action
    |> reverse_players
  end

  def end_turn(game) do
    game
    |> next_player
  end

  # Internal functions

  defp reset_action(game) do
    %{game | action: nil}
  end

  defp next_player(%{players: [current | rest]} = game) do
    %{game | players: rest ++ [current]}
  end

  defp reverse_players(%{players: players} = game) do
    %{game | players: Enum.reverse(players)}
  end

  defp current_player(%{players: [current | _]}) do
    current
  end
end