# This module maps played cards to game actions.
#
# In a normal (Dutch) Mau game, the actions are:
# - Reverse player turns
# - Draw x cards
# - Repeat turn
# - Skip next player
# - Nothing - the game continues
defmodule Mau.Action do
  def action(game, %{value: :ace}) do
    %{game | action: :invert}
  end

  def action(game, %{value: 2}) do
    %{game | action: {:draw, 2}}
  end

  def action(game, %{value: 7}) do
    %{game | action: :repeat}
  end

  def action(game, %{value: 8}) do
    %{game | action: :skip_next}
  end

  def action(game, %{special: :joker}) do
    %{game | action: {:draw, 5}}
  end

  def action(game, %{value: :jack, special: suit}) do
    %{game | action: {:change_suit, suit}}
  end

  def action(game, card) do
    game
  end
end