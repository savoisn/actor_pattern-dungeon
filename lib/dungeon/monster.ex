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
  def start(life, name) do
    {:ok, pid} = GenServer.start_link(__MODULE__, life, name: name)
    pid
  end

  def start_link(life, name) do
    IO.inspect(["ICI", life])
    GenServer.start_link(__MODULE__, life, name: name)
  end

  def attacked(monster, value) do
    GenServer.cast(monster, {:attacked, value})
  end
end
