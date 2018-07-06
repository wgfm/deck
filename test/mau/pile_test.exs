defmodule Mau.PileTest do
  use ExUnit.Case

  alias Mau.Pile

  test "can get the top card from the pile" do
    pile = %Pile{cards: [1, 2, 3]}
    assert Pile.top(pile) == 1
  end

  test "can get the suit from the pile" do
    pile = %Pile{
      cards: [
        %Card{suit: :hearts},
        %Card{suit: :spades},
      ]
    }

    assert Pile.suit(pile) == :hearts
  end

  test "can get the suit from the pile if there is a jack" do
    pile = %Pile{
      jack: :hearts,
      cards: [
        %Card{suit: spades},
        %Card{suit: clubs},
      ]
    }

    assert Pile.suit(pile) == :hearts
  end

  test "can add to the pile" do
    pile = %Pile{cards: [1, 2, 3]}
    new_pile = Pile.add(pile, 0)
    assert new_pile == %Pile{cards: [0, 1, 2, 3]}
  end

  test "can add a jack to the pile" do
    pile = %Pile{}
    new_pile = Pile.add(pile, %Card{value: :jack, suit: :hearts, special: :spades})
    assert new_pile.jack == :spades

    [jack] = new_pile.cards
    assert jack.special == nil
  end
end