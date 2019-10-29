defmodule Dungeon.Monster do
  def grrr do
    :raaa
  end

  def survive(_life) do
    receive do
      {:attacked} -> grrr()
    end
  end

  def start(life) do
    spawn_link(fn -> survive(life) end)
  end
end
