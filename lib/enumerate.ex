defmodule Enumerate do
  @moduledoc false

  def of(list) do
    enumerate(list, [])
  end

  defp enumerate(multidimensional_list = [head | tail], result) when is_list(head) do
    Enum.reduce(multidimensional_list, result, &enumerate/2)
  end

  defp enumerate(list, result) do
    [list | result]
  end
end
