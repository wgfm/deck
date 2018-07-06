defmodule Mau.Server do
  def loop(game) do
    receive do
      :draw ->
        game
        |> Game.make_move(:draw)
        |> loop
      {:play, card} ->
        game
        |> Game.make_move({:play, card})
        |> loop
    end
  end
end