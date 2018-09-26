defmodule Vodka.Query do
  @moduledoc """
  Query management for simple discussion with a chatbot
"""

  def send_query do
    HTTPoison.start
    url = "https://dialogflow.googleapis.com/v2/projects/viny-526fe"

    body = %{
             queryInput: "start"
           }|> Poison.encode!()

    header = [{"Content-type", "application/json"},
              {"Authorization", "Bearer 5074e2a64fbf4388b0dfd61be09b50a8"}]

    HTTPoison.post!(url, body, header, [])
  end
end
