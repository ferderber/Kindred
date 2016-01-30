defmodule Kindred.ChampionMastery do
  @moduledoc """
  Implements the Champion Mastery endpoint: https://developer.riotgames.com/api/methods#!/1034

  """

  @fields ~w(
  championId championLevel championPoints championPointsSinceLastLevel championPointsUntilNextLevel chestGranted highestGrade lastPlayTime playerId
  )
  @doc ~S"""
  Gets a Summoners Champion Mastery for the specified champion

  Args:
    * `summonerId` - Summoner ID
    * `championId` - Champion ID
    * `region` - Region as an atom (`:NA`, `:EUW`, `EUNE`, `:KR`, `:BR`, `:LAN`, `:LAS`, `:OCE`, `:TR`, `:RU`, `:PBE`)

  """
  def get_champion(summonerId, championId, region) do
    Kindred.get(url(region, to_string(summonerId)) <> "/champion/" <> championId)
  end
  @doc ~S"""
  Gets all Champion Masteries for a Summoner

  Args:
    * `summonerId` - Summoner ID
    * `region` - Region as an atom (`:NA`, `:EUW`, `EUNE`, `:KR`, `:BR`, `:LAN`, `:LAS`, `:OCE`, `:TR`, `:RU`, `:PBE`)

  """
  def get_champions(id, region) do
      Kindred.get(url(region, to_string(id)) <> "/champions")
  end
  @doc ~S"""
  Gets Champion Mastery score for a Summoner

  Args:
    * `summonerId` - Summoner ID
    * `region` - Region as an atom (`:NA`, `:EUW`, `EUNE`, `:KR`, `:BR`, `:LAN`, `:LAS`, `:OCE`, `:TR`, `:RU`, `:PBE`)

  """
  def get_score(summonerId, region) do
      Kindred.get(url(region, to_string(summonerId)) <> "/score")
  end
  @doc ~S"""
  Gets a Summoners top Champions
  
  Args:
    * `summonerId` - Summoner ID
    * `region` - Region as an atom (`:NA`, `:EUW`, `EUNE`, `:KR`, `:BR`, `:LAN`, `:LAS`, `:OCE`, `:TR`, `:RU`, `:PBE`)

  """
  def get_top(summonerId, region) do
      Kindred.get(url(region, to_string(summonerId)) <> "/topchampions")
  end
  defp url(region, id) do
    "/championmastery/location/" <> Kindred.Util.get_platform(region) <> "/player/" <> id
  end
end
