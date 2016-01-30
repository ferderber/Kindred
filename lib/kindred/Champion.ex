defmodule Kindred.Champion do
  @moduledoc """
  Implements the champion endpoint: https://developer.riotgames.com/api/methods#!/1059
  """
  @fields ~w(
  champions active botEnabled botMmEnabled freeToPlay id rankedPlayEnabled
  )
  @version Application.get_env(:kindred, :champion)

  @doc ~S"""
  Gets all champions
  """
  def get() do
    Kindred.get(url)
  end
  @doc ~S"""
  Gets a champion by ID

  Args:
    * `id` - Champion ID
  """
  def get(id) do
    Kindred.get(url(to_string(id)))
  end
  defp url(id) do
    url() <> "/" <> id
  end
  defp url() do
    @version <> "/champion"
  end
end
