defmodule Kindred.Summoner do
  @moduledoc """
  Implements the Game endpoint: https://developer.riotgames.com/api/methods#!/1060

  """
  @fields ~w(

  )
  @version Application.get_env(:kindred,:summoner)

  @doc ~S"""
  Gets summoner(s) by name

  Args:
    * `summoners` - Either a list or single name (["Ferdora", "Test", "Player"], "Ferdora")
  """
  def get_by_name(summoners), do:
      Kindred.get(format(summoners) |> url(:obj))
  @doc ~S"""
  Gets summoner(s) masteries

  Args:
    * `summoners` - Either a list or single name (["Ferdora", "Test", "Player"], "Ferdora")

  """
  def get_masteries(summoners), do:
      Kindred.get(format(summoners) |> url(:masteries))
  @doc ~S"""
  Gets summoner(s) ids

  Args:
    * `summoners` - Either a list or single name (["Ferdora", "Test", "Player"], "Ferdora")

  """
  def get_ids(summoners), do:
      Kindred.get(format(summoners) |> url(:ids))
  @doc ~S"""
  Gets summoner(s) recent games
  
  Args:
    * `summoners` - Either a list or single name (["1111111", "332123", "1112352"], "11111111")

  """
  def get_name(summoners), do:
      Kindred.get(format(summoners) |> url(:name))
  @doc ~S"""
  Gets summoner(s) rune pages

  Args:
    * `summoners` - Either a list or single id (["1111111", "332123", "1112352"], "11111111")

  """
  def get_runes(summoners), do:
      Kindred.get(format(summoners) |> url(:runes))

  defp format(summoners), do:
    if is_list(summoners), do:
      summoners |>
      Enum.map(fn(x) -> String.replace(x, " ", "", []) end) |>
      Enum.join(","), else: summoners
  defp url(summoner, type) do
    @version <>
    case type do
      :obj -> "/summoner/by-name/" <> summoner
      :ids -> "/summoner/" <> summoner
      :masteries -> "/summoner/" <> summoner <> "/masteries"
      :name -> "/summoner/" <> summoner <> "/name"
      :runes -> "/summoner/" <> summoner <> "/runes"
    end
  end
end
