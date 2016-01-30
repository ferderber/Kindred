defmodule GameTest do
  use ExUnit.Case, async: true
  import Kindred.Game
  doctest Kindred.Game
  test "Get games of existing summoner" do
    r = get_recent("27754362")
    assert ({:ok, _} = r)
  end
  test "Get games of non-existant summoner" do
    r = get_recent("-9")
    assert ({404, _} = r)
  end
end
