# This module contains the logic to determine legal moves
defmodule Mau.Moves do
  # Can play equal values
  def move(%{value: top}, %{value: to_play}) when top == to_play, do: :ok

  # Can play equal suits
  def move(%{suit: top}, %{suit: to_play}) when top == to_play, do: :ok

  # Can play joker on all cards
  def move(_, %{special: joker}), do: :ok

  # Move not found
  def move(_top, _to_play) do
    :invalid
  end
end