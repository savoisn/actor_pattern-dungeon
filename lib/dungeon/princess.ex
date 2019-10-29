defmodule Dungeon.Princess do
  def hi() do
    :hello
  end

  def start() do
    spawn(fn -> hi() end)
  end

  # API
  def start_killing_machine() do
    spawn(fn -> wait_for_orders() end)
  end

  def attack_with_sword(princess, monster) do
    send(princess, {:attack_with_sword, monster})
  end

  def attack_with_mace(princess, monster) do
    case Process.alive?(princess) do
      true -> send(princess, {:attack_with_mace, monster})
      false -> raise "Princess dead"
    end
  end

  # Server
  def wait_for_orders() do
    receive do
      {:attack_with_sword, monster} ->
        send(monster, {:attacked})

      {:attack_with_mace, monster} ->
        send(monster, {:attacked})
    end

    wait_for_orders()
  end
end
