defmodule GenerateTree do
  @moduledoc false

  def of(set, pick) do
    node = generate_tree(set, pick)
    children = cond do
      is_list(node) -> node
      true -> [node]
    end

    %Tree.Root{children: children}
  end

  defp generate_tree(list, 1) do
    Enum.map(list, fn element -> %Tree.Leaf{value: element} end)
  end

  defp generate_tree(list, depth) when length(list) == depth do
    [last_element] = Enum.take(list, -1)
    leaf = %Tree.Leaf{value: last_element}

    list
    |> Enum.drop(-1)
    |> Enum.reduce(leaf, fn element, acc -> %Tree.Node{value: element, children: [acc]} end)
  end

  defp generate_tree(list, depth) do
    [head | tail] = list
    children = generate_tree(tail, depth - 1)

    tree = generate_tree(tail, depth)
    node = %Tree.Node{value: head, children: children}

    cond do
      is_list(tree) -> [node | tree]
      true -> [node, tree]
    end
  end

end
