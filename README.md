# Kindred

[![Build Status](https://travis-ci.org/matthewferderber/Kindred.svg?branch=master)](https://travis-ci.org/matthewferderber/Kindred)

**Kindred is a League of Legends API client written in Elixir.**

**Documentation available at: <http://hexdocs.pm/kindred>**

**Still being worked on heavily, things will probably change as the rest of the api is implemented**

###Working Features

Currently only the following endpoints are added:

* Champion Mastery
* Champion
* Summoner
* Game

##Usage
    client = Kindred.Client.new("na", System.get_env("LEAGUE_API_KEY"), 10)
    Kindred.new(client)
    response = Kindred.Summoner.get_by_name("Ferdora")
    IO.inspect response
    # {:ok, %{"ferdora" => %{"id" => 27754362, "name" => "Ferdora", "profileIconId" => 599,
    # "revisionDate" => 1454047682000, "summonerLevel" => 30}}}


## Installation

The package can be installed by adding Kindred to your list of dependencies in `mix.exs`:

        def deps do
          [{:kindred, "~> 0.0.1"}]
        end

Kindred API isn't endorsed by Riot Games and doesn't reflect the views or opinions of Riot Games or anyone
officially involved in producing or managing League of Legends. League of Legends and Riot Games are trademarks or registered trademarks of Riot Games, Inc. League of Legends © Riot Games, Inc.
