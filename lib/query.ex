defmodule Vodka.Query do
  @moduledoc """
  Query management for simple discussion with a chatbot
"""

  def send_query(token) do
    HTTPoison.start
    url = "https://dialogflow.googleapis.com/v2/projects/viny-526fe/agent/sessions/42000:detectIntent"

    body = %{
             queryInput: "start"
           }|> Poison.encode!()

    header = [
      {"Authorization", "Bearer #{token.token}"},
      {"Content-Type", "application/json"}
    ]

    HTTPoison.post!(url, body, header, [])
  end
end
