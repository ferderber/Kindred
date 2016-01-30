defmodule ChampionTest do
  use ExUnit.Case, async: true
  import Kindred.Champion
  doctest Kindred.Champion
  test "Get all champions" do
    r = get()
    assert ({:ok, _} = r)
  end
  test "Get champion by id" do
    r = get(1)
    assert ({:ok, _} = r)
  end
end
