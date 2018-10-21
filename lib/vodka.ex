defmodule Vodka do

  def start do
    HTTPoison.start
  end


  def generate_access_token do
    Goth.Token.for_scope("https://www.googleapis.com/auth/cloud-platform")
  end

  def main(args \\ []) do
    start()
    {:ok, token} = generate_access_token()
    {:ok, response} = Vodka.Query.send_query(token, "start", "fr")
    IO.puts(response["queryResult"]["fulfillmentText"])


  end
end
