defmodule Tree do
  defmodule Root do
    defstruct [:children]
  end

  defmodule Node do
    @moduledoc false

    defstruct [:value, :children]
  end

  defmodule Leaf do
    defstruct [:value]
  end
end
