defmodule Vodka do

  def generate_access_token do
    Goth.Token.for_scope("https://www.googleapis.com/auth/cloud-platform")
  end

  def main(args) do
    {:ok, token} = generate_access_token()
    IO.inspect(Vodka.Query.send_query(token))
  end
end
