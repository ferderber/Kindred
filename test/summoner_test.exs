defmodule SummonerTest do
  use ExUnit.Case, async: true
  import Kindred.Summoner
  doctest Kindred.Summoner
  test "Get summoner" do
    r = get_by_name("Ferdora")
    assert ({:ok, _} = r)
  end
  test "Get list of summoners" do
    r = get_by_name(["Ferdora", "test", "Riot Jaws"])
    assert ({:ok, _} = r)
  end
end
