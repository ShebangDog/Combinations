defmodule Combinations do
  @moduledoc false

  def of(set, pick) when length(set) >= pick do
    GenerateTree.of(set, pick) |>
    Enumerate.of
  end

end
