defmodule Combinations do
  @moduledoc false

  def of(set, pick) when length(set) >= pick do
    tree = GenerateTree.of(set, pick)
    list = ConvertTree.of(tree)

    Enum.flat_map(list, &Enumerate.of/1)
  end

end
