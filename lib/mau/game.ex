# A game of Mau has n players, where n >= 2.
#
# Players are in a circle, each taking turns clockwise.
defmodule Mau.Game do
  defstruct players: [], deck: nil, pile: nil, action: nil

  alias Mau.{Pile, Player, Game, Turn}

  def start(num_players) do
    deck = Decks.standard_52(jokers: 2, shuffle: true)

    {deck, players} = Enum.reduce(1..num_players, {deck, []}, fn id, {deck, players} ->
      {player, new_deck} = Player.start(deck)
      {new_deck, [player | players]}
    end)

    {card, deck} = Deck.draw(deck)

    %Game{
      players: players,
      deck: deck,
      pile: %Pile{cards: [card]}
    }
  end

  # Public interface: Callable by the current player

  def draw(game) do
    Turn.draw(game)
    |> end_turn
  end

  def play(game, card) do
    Turn.play(game, card)
    |> end_turn
  end

  def pass(game) do
    Turn.pass(game)
    |> end_turn
  end

  # Updating functions

  def update_pile(game, pile) do
    %{game | pile: pile}
  end

  def update_current_player(%{players: [current | rest]} = game, player) do
    %{game | players: [player | rest]}
  end

  def update_deck(game, deck) do
    %{game | deck: deck}
  end

  # Queries

  def current_player(%{players: [current | _]}) do
    current
  end

  def pile(game) do
    game.pile
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

   # Turn logic

  defp end_turn(%{action: :repeat} = game) do
    game
    |> reset_action
  end

  defp end_turn(%{action: :skip_next} = game) do
    game
    |> reset_action
    |> next_player
    |> next_player
  end

  defp end_turn(%{action: :invert} = game) do
    game
    |> reset_action
    |> reverse_players
  end

  defp end_turn(game) do
    game
    |> next_player
  end
end