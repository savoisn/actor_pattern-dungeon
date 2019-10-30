defmodule Dungeon.Princess do
  alias Dungeon.Monster

  def hi() do
    :hello
  end

  @sword_attack_value 2
  @mace_attack_value 3

  def start() do
    spawn(fn -> hi() end)
  end

  # API
  def start_killing_machine() do
    spawn(fn -> wait_for_orders() end)
  end

  def attack_with_sword(princess, monster) do
    send(princess, {:attack_with_sword, monster, @sword_attack_value})
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
      {:attack_with_sword, monster, value} ->
        Monster.attacked(monster, value)

      {:attack_with_mace, monster} ->
        send(monster, {:attacked})
    end

    wait_for_orders()
  end
end
