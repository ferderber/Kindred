defmodule RateTest do
  use ExUnit.Case, async: true
  import Kindred.Champion
  doctest Kindred.Champion
  test "10 requests with rate limiter" do
    r = recurseRequest(10)
    assert ({:ok, _} = r)

  end
  defp recurseRequest(count) do
      r = get(1)
      if count >= 0, do: recurseRequest(count-1),
    else: r
  end
end
