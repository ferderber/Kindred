defmodule Kindred.Client do
  defstruct region: "na", key: nil, limit: 10, highLimit: 600

  @type t :: %__MODULE__{region: binary, key: binary, limit: binary}

  @spec new(binary, binary, binary) :: t
  def new(region, key, limit) do
    region = region
    key = key
    limit = limit
    %__MODULE__{region: region, key: key, limit: limit}
  end

end
