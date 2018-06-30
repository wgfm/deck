# A Card is a representation of a playing card.
# A Card has a suit and a value, and can have a special attribute, such as :joker
defmodule Card do
  defstruct suit: nil, value: nil, special: nil
end