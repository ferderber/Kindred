defmodule Kindred.Game do
  @moduledoc """
  Implements the Game endpoint: https://developer.riotgames.com/api/methods#!/1060
  """

  @fields ~w(
    games, summonerId
  )
  @version Application.get_env(:kindred, :game)

  @doc ~S"""
  Gets a Summoners recent games
  Args:
    * `summonerId` - Summoner ID
  """
  def get_recent(summonerId) do
    Kindred.get(summonerId |> url)
  end
  defp url(summonerId) do
    "#{@version}/game/by-summoner/#{summonerId}/recent"
  end
end
