defmodule Dungeon.Princess do
  def hi() do
    :hello
  end

  def start() do
    spawn(fn -> hi() end)
  end
end
