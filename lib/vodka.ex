defmodule Vodka do

  def start do
    HTTPoison.start
    generate_access_token
  end


  defp generate_access_token do
    Goth.Token.for_scope("https://www.googleapis.com/auth/cloud-platform")
  end

  def main(args \\ []) do
    {:ok, token} = start
    IO.inspect(token)
    {:ok, response} = Vodka.Query.send_query("viny-526fe", token, "je veux un pull", "fr", 1)
    {:ok, response} = Vodka.Context.get("viny-526fe", token, 1, "vetement")
    IO.inspect(response)
    {:ok, response} = Vodka.Context.delete_all("viny-526fe", token, 1)
    IO.inspect(response)
    {:ok, response} = Vodka.Context.get("viny-526fe", token, 1, "vetement")
    IO.inspect(response)


  end
end
