defmodule Kindred.Util do
  def get_platform(region) do
    case region do
      :NA ->"NA1"
      :BR ->"BR1"
      :KR ->"KR"
      :EUW -> "EUW1"
      :EUNE -> "EUNE"
      :LAN -> "LA1"
      :LAS -> "LA2"
      :OCE -> "OC1"
      :TR -> "TR1"
      :RU -> "RU"
      :PBE -> "PBE1"
    end
  end
  def add_region(url, region) do
    String.replace(url,"region", region)
  end
end
