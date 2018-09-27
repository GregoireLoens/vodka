defmodule Vodka do

  def start do
    HTTPoison.start
  end

  def stop do
    HTTPoison.stop
  end

  def generate_access_token do
    Goth.Token.for_scope("https://www.googleapis.com/auth/cloud-platform")
  end

  def main(args) do
    start()
    {:ok, token} = generate_access_token()
    IO.inspect(Vodka.Query.send_query(token, "start", "fr"))
  end
end
