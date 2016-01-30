defmodule Kindred do
use HTTPoison.Base
  @moduledoc """
  Base module for Kindred which handles the requests and parsing the responses
  """
  @user_agent [{"User-agent", "Kindred"}]

  def new(client) do
    Agent.start_link(fn -> client end, name: __MODULE__)
  end

  def get(path) do
    Agent.get(__MODULE__, fn client -> request(client, path) end, 15_000)
  end
  @type response :: {integer, any} | :jsx.json_term
  @spec parse_response(HTTPoison.Response.t) :: response
  defp parse_response(response) do
    status_code = response.status_code
    body = response.body
    IO.puts response.headers["Content-Type"]
    if (response.headers["Content-Type"] == "application/json; charset=UTF-8" and status_code != 404) do
      response = Poison.decode!(body)
      {:ok, response}
    else
      {status_code, nil}
    end
  end
  @spec get(Kindred.Client, Binary) :: response
  defp request(client, path) do
    highLimit = ExRated.check_rate("lol-api-limit-high", client.highLimit * 1000, 500)
    case highLimit do
      {:error, _} ->  :timer.sleep(elem(ExRated.inspect_bucket("lol-api-limit-high", client.limit *1000, 500),2))
      _ -> nil
    end
    limit = ExRated.check_rate("lol-api-limit-low", client.limit * 1000, 10)
    case limit do
      {:error, _} ->  :timer.sleep(elem(ExRated.inspect_bucket("lol-api-limit-low", client.limit *1000, 10),2))
      _ -> nil
    end
      json_request(:get, process_url(client, path))
  end
  defp process_url(client, path) do
    "https://" <> client.region <>
    ".api.pvp.net/api/lol/" <> client.region <>
    path <> "?api_key=" <> client.key
  end
  defp json_request(method, url) do
    request!(method, url) |> parse_response
  end
end
