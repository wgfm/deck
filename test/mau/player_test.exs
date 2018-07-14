defmodule Mau.PlayerTest do
  use ExUnit.Case

  test "will start with seven cards" do
    {player, _} = Player.start(deck())
    
    assert Player.hand_size(player) == 7
  end

  test "can draw a card" do
    player = %Player{hand: [:one]}
             |> Player.draw(:two)

    assert Player.hand_size(player) == 2
  end

  test "can show hand size" do
    player = Player{hand: [:one, :two]}

    assert Player.hand_size(player) == 2
  end

  defp deck do
    Decks.standard_52()
  end
end