defmodule Dungeon.PrincessTest do
  alias Dungeon.Princess
  use ExUnit.Case
  # doctest Dungeon.Princess

  setup do
    # do someting to setup test

    on_exit(fn ->
      # do something when test exits
      nil
    end)
  end

  test "princess should say hi" do
    assert Princess.hi() == :hello
  end

  test "princess should start as a process" do
    pid = Princess.start()
    assert is_pid(pid)
    assert Process.alive?(pid)
    :timer.sleep(1)
    assert !Process.alive?(pid)
  end
end
