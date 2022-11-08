defmodule Enumerate do
  @moduledoc false

  def of(tree, result \\ []) do
    case tree do
      %Tree.Root{children: children} ->
        Enum.flat_map(children, &of(&1, result))
      %Tree.Node{value: value, children: children} ->
        Enum.flat_map(children, &of(&1, [value | result]))
      %Tree.Leaf{value: value} -> [[value | result]]
    end
  end
end
