defmodule DungeonTest do
  alias Dungeon.Princess
  alias Dungeon.Monster
  use ExUnit.Case

  test "Princes attacks monster" do
    monster = Monster.start(3)
    assert Process.alive?(monster)
    princess = Princess.start_killing_machine()
    assert Process.alive?(princess)
    Princess.attack_with_sword(princess, monster)
    :timer.sleep(2)
    refute Process.alive?(monster)

    assert_raise RuntimeError, "Princess dead", fn ->
      Princess.attack_with_mace(princess, monster)
    end
  end
end
