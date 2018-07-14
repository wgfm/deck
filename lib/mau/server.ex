defmodule Mau.Server do
  alias Mau.Game

  def loop(game) do
    receive do
      :draw ->
        game
        |> Game.draw()
        |> loop
      {:play, card} ->
        game
        |> Game.play(card)
        |> loop
    end
  end
end