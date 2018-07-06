defmodule Mau.PileTest do
  use ExUnit.Case

  alias Mau.Pile

  test "can get the top card from the pile" do
    pile = %Pile{cards: [1, 2, 3]}
    assert Pile.top(pile) == 1
  end

  test "can add to the pile" do
    pile = %Pile{cards: [1, 2, 3]}
    new_pile = Pile.add(pile, 0)
    assert new_pile == %Pile{cards: [0, 1, 2, 3]}
  end
end