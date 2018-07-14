defmodule Mau.Turn do
  alias Mau.{Game, Player, Pile}

  def draw(game) do
    {card, deck} = Deck.draw(game.deck)

    player = game
             |> Game.current_player()
             |> Player.draw(card)

    game
    |> Game.update_current_player(player)
    |> Game.update_deck(deck)
  end

  def pass(game) do
    player = Game.current_player(game)
    pass_and_maybe_draw(game, player)
  end

  def play(game, card) do
    player = game
             |> Game.current_player()
             |> Player.play(card)

    pile = game
           |> Game.pile()
           |> Pile.add(card)

    game
    |> Game.update_pile(pile)
    |> Game.update_current_player(player)
  end

  # If the player has drawn, allow the pass
  defp pass_and_maybe_draw(game, %{drawn: true}) do
    game
  end

  # If the player did not draw, force the draw.
  defp pass_and_maybe_draw(game, %{drawn: false}) do
    draw(game)
  end
end