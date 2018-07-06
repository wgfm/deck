# The Pile is the stack of cards that have been played.
# When the Deck is empty, it will be initialized with the
# tail of the cards on the Pile, and subsequently shuffled.
#
# The Jack suit-change is also implemented in Pile
defmodule Mau.Pile do
  defstruct cards: [], jack: nil

  alias Mau.Pile

  # Shuffle takes a pile, shuffles all but the topmost card
  # and turns it into a deck. The topmost card on the pile
  # will form the new pile.
  def shuffle(pile) do
    [top | rest] = pile.cards
    
    deck = %Deck{cards: rest}
           |> Deck.shuffle
    
    { %Pile{cards: [top]}, deck }
  end

  def top(%{cards: [top, _]) do
    top
  end

  def suit(%{jack: nil} = pile) do
    Pile.top(pile).suit
  end

  def suit(%{jack: suit}) do
    suit
  end

  def add(pile, %{value: :jack, special: suit} = card) do
    card = %{card | special: nil}
    %{pile | cards: [card | pile.cards], jack: suit}
  end

  def add(pile, card) do
    %{pile | cards: [card | pile.cards], jack: nil}
  end
end