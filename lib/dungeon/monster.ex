defmodule Dungeon.Monster do
  use GenServer

  def grrr do
    :raaa
  end

  def survive(_life) do
    receive do
      {:attacked} -> grrr()
    end
  end

  def init(args) do
    {:ok, args}
  end

  def handle_cast({:attacked, value}, state) when is_integer(value) do
    case state - value <= 0 do
      true -> Process.exit(self(), :death_by_princess)
      false -> nil
    end

    {:noreply, state - value}
  end

  # Client API
  def start(life = _state) do
    {:ok, pid} = GenServer.start_link(__MODULE__, life)
    pid
  end

  def attacked(monster, value) do
    GenServer.cast(monster, {:attacked, value})
  end
end
