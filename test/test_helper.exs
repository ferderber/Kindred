ExUnit.start()
client = Kindred.Client.new("na", System.get_env("LEAGUE_API_KEY"), 20)
Kindred.new(client)
