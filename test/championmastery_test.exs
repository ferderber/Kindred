defmodule ChampionMasteryTest do
  use ExUnit.Case, async: true
  import Kindred.ChampionMastery
  doctest Kindred.ChampionMastery
  test "Get mastery for all champions" do
    r = get_champions("27754362", :NA)
    assert ({:ok, _} = r)
  end
end
